module System
  module Models
    class ApiKey < ApplicationRecord
      has_and_belongs_to_many :realms, class_name: 'Apiv2::Realm', optional: true

      def as_json(options = {})
        #super(options)
        super(options).merge(realms: self.realms.map(&:id))
      end
    end
  end
end
