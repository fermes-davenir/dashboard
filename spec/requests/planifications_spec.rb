require 'rails_helper'

RSpec.describe "Planifications", type: :request do
  describe "GET /planifications" do
    it "works! (now write some real specs)" do
      get planifications_path
      expect(response).to have_http_status(200)
    end
  end
end
