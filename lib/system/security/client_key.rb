module System
  module Security
    class ClientKey
      CATEGORY_NAME = 'ApiKey'
      KEYCACHE_TTL = 86400

      def self.generate_key
        Digest::SHA2.hexdigest("#{Time.zone.now}:#{Random::rand(999999999)}::#{Random::rand(999999999)}")
      end

      def self.get_api_client(key, client_ip)
        return false if key.blank?

        apikey = System::Cache::hgetall(CATEGORY_NAME, key)
        if apikey.blank?
          apikey = System::Models::ApiKey.where(key: key).first
          apikey = apikey.as_json() if apikey.present?
        end

        unless apikey && validate_ip(client_ip, apikey[:ip_whitelist], apikey[:ip_blacklist])
          nil
        end
        System::Cache.hsetall(CATEGORY_NAME, key, apikey, KEYCACHE_TTL)
        apikey
      end

      def self.authorize_key(key, client_ip)
        !load_and_authorize_api_client.blank?
      end

      def self.invalidate_key
        System::Models::ApiKey.where(key: key).delete_all
        System::Cache.remove(CATEGORY_NAME, key)
      end

      private_class_method def self.validate_ip(client_ip, whitelist, blacklist)
        true
      end
    end
  end
end
