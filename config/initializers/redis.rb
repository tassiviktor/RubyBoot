require 'connection_pool'
REDIS = ConnectionPool.new(size: (ENV['RAILS_MAX_THREADS'] || 5)) do
	r = Redis.new 
	r.select 1
	r
end