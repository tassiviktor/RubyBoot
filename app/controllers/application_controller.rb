class ApplicationController < ActionController::API

  #MASTER_TOKEN = '82ccb565bcc9560b03a0a9bad8c20a4974ff499a42f7ee8834ea6d31d05a73787a5d8ec19308dcb54b169ef5a3'

  before_action :check_client_key

  private

  # Client authentication 
  #
  # Every clients to connect to API must be authenticated with a key 
  #
  # TODO: To be replaced with an extendable configurable multi key auth
  #
  def check_client_key
    return true
  end

end
