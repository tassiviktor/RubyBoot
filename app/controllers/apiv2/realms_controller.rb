# frozen_string_literal: true

module Apiv2
  # Realms
  class RealmsController < ApplicationController

    RESOURCE_CLASS = Apiv2::Realm
    RESOURCE_INDEX = Apiv2::Realm
    RESOURCE_SYM = :apiv2_realm
    include Crud

    # Must be run after other before_action hooks
    before_action :check_master_key, only: %i[index create update destroy]

    #Only client with master key able to set/modify realm data
    def check_master_key
      respond_forbidden unless @api_key.present? && @api_key["is_master_key"]
    end

  end
end
