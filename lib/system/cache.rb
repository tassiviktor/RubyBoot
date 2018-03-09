require 'connection_pool'

module System
  class Cache

    def self.setup(database , size, ttl=86400)

      if self.redis_pool.present?
        raise RuntimeError, "Redis pool already initialized!"
      end

      p "Initialize Redis pool at database:#{database},with #{size} active connection(s)"

      self.database = database
      self.ttl = ttl
      self.redis_pool = ConnectionPool.new(size: size) do
        r = Redis.new
        r.select database
        r
      end
      self.redis_pool
    end

    def self.hset(category, key, value, validity_key, ttl = nil)
      self.redis_pool.with  do |conn|
        conn.hmset("#{category}:#{key}", "value", ( (value.is_a? String) ? value : value.to_json ), "validity_key", validity_key)
        conn.expireat( "#{category}:#{key}", (Time.zone.now.to_i+(ttl.present? ? ttl : self.ttl)).to_i)
      end
    end

    def self.hget(category, key, validity_hash, default_value = nil)
      self.redis_pool.with  do |conn|
        if (conn.hget "#{category}:#{key}" "validity_hash") == validity_hash
          #retouch
          conn.expireat("#{category}:#{key}",(Time.zone.now+self.ttl).to_i)
          return conn.hget "#{category}:#{key}" "value"
        end
      end
      default_value
    end

    def self.hgetall(category, key, default_value = nil)
      self.redis_pool.with  do |conn|
        conn.exists("#{category}:#{key}") ? conn.hgetall("#{category}:#{key}") : default_value
      end
    end

    def self.hsetall(category, key, value, ttl = nil)
      self.redis_pool.with  do |conn|
        conn.mapped_hmset("#{category}:#{key}", value) && conn.expireat( "#{category}:#{key}", (Time.zone.now.to_i+(ttl.present? ? ttl : self.ttl)).to_i)
      end
    end

    def self.set(category, key, value, ttl = nil)
      self.redis_pool.with  do |conn|
        conn.set("#{category}:#{key}", (value.is_a? String) ? value : value.to_json) && conn.expireat( "#{category}:#{key}", (Time.zone.now.to_i+(ttl.present? ? ttl : self.ttl)).to_i)
      end
    end

    def self.get(category, key, default_value = nil)
      self.redis_pool.with  do |conn|
        conn.exists("#{category}:#{key}") ? conn.get("#{category}:#{key}") : default_value
      end
    end

    def self.exists(category, key)
    	conn.exists("#{category}:#{key}") 
    end

    def self.generate_hashed_key(item, params)
      "#{item}_#{params.to_s}"
    end

    def pool
      :redis_pool
    end

    private

    cattr_accessor :redis_pool
    cattr_accessor :database
    cattr_accessor :ttl
  end
end
