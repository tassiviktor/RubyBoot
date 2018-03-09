module System

  module Security
    
    class ClientKey
      
      CATEGORY_NAME = 'ApiKey'
      KEYCACHE_TTL = 10

      def self.generate_key
        Digest::SHA2.hexdigest("#{Time.zone.now}:#{Random::rand(999999999)}::#{Random::rand(999999999)}")
      end

      def self.authorize_key(key, client_ip)

        return false if key.blank?

        apikey = System::Cache::hgetall(CATEGORY_NAME, key)
        if apikey.blank?
          apikey = System::Models::ApiKey.where(key: key).first
          apikey = apikey.attributes if apikey.present?
        end

        apikey && validate_ip(client_ip,apikey[:ip_whitelist],apikey[:ip_blacklist]) && System::Cache::hsetall(CATEGORY_NAME, key, apikey, KEYCACHE_TTL)
      end

      def self.invalidate_key
        System::Models::ApiKey.where(key: key).delete_all
        System::Cache::remove(CATEGORY_NAME,key)
      end

      private

      def self.find_key_in_cache(key)
      end

      def self.validate_ip(client_ip, whitelist, blacklist)
        return true
      end
    end

  end

end