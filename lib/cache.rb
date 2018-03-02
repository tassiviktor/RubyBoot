class Cache

  def initialize(pool, database , ttl=86400)
    self.redis_pool = pool
    self.database = database
    self.ttl = ttl
  end

  def set(category, key, value, validity_key, ttl = nil)
  	self.redis_pool.with  do |conn|
      conn.hmset("#{category}:#{key}", "value", value.to_json, "validity_key", validity_key)
      conn.expireat "#{category}:#{key}", (Time.zone.now+(ttl.present? ? ttl : self.ttl)).to_i
    end
  end

	def get(category, key, validity_hash, default_value = nil)
		self.redis_pool.with  do |conn|
      if (conn.hget "#{category}:#{key}" "validity_hash") == validity_hash
      	#retouch
      	conn.expireat "#{category}:#{key}" (Time.zone.now+self.ttl).to_i
      	return conn.hget "#{category}:#{key}" "value"
      end
    end
    default_value
  end

  def generate_hashed_key(item, params)
  	"#{item}_#{params.to_s}"
  end

  private
  attr_accessor :redis_pool
  attr_accessor :database
  attr_accessor :ttl
end
