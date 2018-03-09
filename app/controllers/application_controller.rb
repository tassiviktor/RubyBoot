require 'system.rb'
class ApplicationController < ActionController::API

  # Rescue from most common errors
  rescue_from StandardError, with: :respond_internal_server_error
  rescue_from ScriptError, with: :respond_internal_server_error

  def require_api_key!
    api_key = request.headers[( ENV["API_KEY_HEADER_FIELD"] || "HTTP_X_API_KEY" )]
    respond_forbidden("Forbidden","Proper API key required") if !System::Security::ClientKey::authorize_key(api_key, request.remote_ip)
  end

  private

  def respond_internal_server_error(exception)
    logger.error exception.message
    logger.error exception.backtrace.join("\n")
    render json: {:error => 'Internal server error.'}, status: 500
  end

  def respond_forbidden(message = 'Forbidden', details = '')
    render json: {:error => message, 'details' => details}, status: 403
  end

end
