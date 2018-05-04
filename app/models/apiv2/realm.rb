# frozen_string_literal: true

# Realm model
module Apiv2
  class Realm < ApplicationRecord
    has_many :users
  end
end
