require 'connection_pool'
REDIS = ConnectionPool.new(size: 10) do
	r = Redis.new 
	r.select 1
	r
end