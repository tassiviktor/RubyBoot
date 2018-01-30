class ApplicationController < ActionController::API

  MASTER_TOKEN = '82ccb565bcc9560b03a0a9bad8c20a4974ff499a42f7ee8834ea6d31d05a73787a5d8ec19308dcb54b169ef5a3'

  before_action :authenticate

  private

  # TODO: To be replaced with an extendable configurable multi key auth
  #
  def authenticate

    # First level authentitcation for clients (not users)
    head :unauthorized unless (request.headers['X-Api-Key'].present? &&
                               ActiveSupport::SecurityUtils.secure_compare(
                                 ::Digest::SHA512.hexdigest(request.headers['X-Api-Key']),
                                 ::Digest::SHA512.hexdigest(MASTER_TOKEN)
    ))
  end

end
