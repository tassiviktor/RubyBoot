require 'rails_helper'

RSpec.describe "Api::Partners", type: :request do
  describe "GET /api_partners" do
    it "works! (now write some real specs)" do
      get api_partners_path
      expect(response).to have_http_status(200)
    end
  end
end
