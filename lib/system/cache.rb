# frozen_string_literal: true

require 'connection_pool'

module System
  # Full static class may provide low mem usage, and can simply share pool
  # across threads. Redis-ing is a thread safe
  class Cache
    def self.hset(category, key, value, validity_key, ttl = nil)
      pool.with do |conn|
        value = value.is_a? String ? value : value.to_json
        conn.hmset(build_key(category, key), 'value', value, 'validity_key', validity_key)
        conn.expireat(build_key(category, key), calc_expire(ttl))
      end
    end

    def self.hget(category, key, validity_hash, default_value = nil)
      pool.with do |conn|
        if conn.hget(build_key(category, key), 'validity_hash') == validity_hash
          # retouch
          conn.expireat(build_key(category, key), (Time.zone.now + ttl).to_i)
          return conn.hget(build_key(category, key), 'value')
        end
      end
      default_value
    end

    def self.hgetall(category, key, default_value = nil)
      pool.with do |conn|
        if conn.exists(build_key(category, key))
          conn.hgetall(build_key(category, key))
        else
          default_value
        end
      end
    end

    def self.hsetall(category, key, value, ttl = nil)
      pool.with do |conn|
        conn.mapped_hmset(build_key(category, key), value) &&
          conn.expireat(build_key(category, key), calc_expire(ttl))
      end
    end

    def self.set(category, key, value, ttl = nil)
      pool.with do |conn|
        value = value.is_a? String ? value : value.to_json

        conn.set(build_key(category, key), value) &&
          conn.expireat(build_key(category, key), calc_expire(ttl))
      end
    end

    def self.get(category, key, default_value = nil)
      pool.with do |conn|
        if conn.exists(build_key(category, key))
          conn.get(build_key(category, key))
        else
          default_value
        end
      end
    end

    def self.exists(category, key)
      pool.with do |conn|
        conn.exists(build_key(category, key))
      end
    end

    def self.generate_hashed_key(item, params)
      "#{item}_#{params}"
    end

    def self.pool
      if redis_pool.blank?
        redis_pool = ConnectionPool.new(size: (ENV['RAILS_MAX_THREADS'] || 5)) do
          r = Redis.new
          r.select database
          r
        end
      end
      redis_pool
    end

    private cattr_accessor :redis_pool
    private cattr_accessor :database
    private cattr_accessor :ttl

    private_class_method def self.build_key(category, key)
      "#{category}:#{key}"
    end

    private_class_method def calc_expire(ttl)
      Time.zone.now.to_i + (ttl.present? ? ttl : self.ttl).to_i
    end
  end
end
