# frozen_string_literal: true

module Apiv2
  # Realms
  class RealmsController < ApplicationController
    RESOURCE_CLASS = Apiv2::Realm
    RESOURCE_SYM = :apiv2_realm
    include Crud
  end
end
