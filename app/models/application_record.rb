# frozen_string_literal: true

# Generic application record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
