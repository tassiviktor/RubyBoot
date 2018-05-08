module System
  module Models
    class ApiKey < ApplicationRecord
      has_and_belongs_to_many :realms, class_name: 'Apiv2::Realm', optional: true
    end
  end
end
