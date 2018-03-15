# frozen_string_literal: true

module Apiv2
  # Users
  class User < ApplicationRecord
    belongs_to :realm
  end
end
