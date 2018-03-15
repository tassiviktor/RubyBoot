require 'rails_helper'

RSpec.describe "Apiv2::Users", type: :request do
  describe "GET /apiv2_users" do
    it "works! (now write some real specs)" do
      get apiv2_users_path
      expect(response).to have_http_status(200)
    end
  end
end
