require 'rails_helper'

RSpec.describe "Apiv2::Realms", type: :request do
  describe "GET /apiv2_realms" do
    it "works! (now write some real specs)" do
      get apiv2_realms_path
      expect(response).to have_http_status(200)
    end
  end
end
