# frozen_string_literal: true

module Apiv2

  # Users
  class User < ApplicationRecord
    belongs_to :realm

    #fetching at compile time
    BELONGS_TO = reflect_on_all_associations(:belongs_to).map(&:plural_name)
    HAS_MANY = reflect_on_all_associations(:has_many).map(&:plural_name)

  end
end
