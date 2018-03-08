require 'system.rb'
class ApplicationController < ActionController::API

  # Rescue from most common errors
  rescue_from StandardError, with: :respond_internal_server_error
  rescue_from ScriptError, with: :respond_internal_server_error

  # Hooks
  before_action :check_client_key

  private

  def check_client_key
    return System::Security::ClientKey::authorize_key("")
  end

  def respond_internal_server_error(exception)
    logger.error exception.message
    logger.error exception.backtrace.join("\n")
    render json: {:error => 'Internal server error.'}, status: 500
  end

end
