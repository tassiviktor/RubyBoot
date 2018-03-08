class ApplicationController < ActionController::API

  before_action :check_client_key

  private

  def check_client_key
    return true
  end

end
