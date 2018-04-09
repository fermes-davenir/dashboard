require 'rails_helper'

RSpec.describe "Possibilities", type: :request do
  describe "GET /possibilities" do
    it "works! (now write some real specs)" do
      get possibilities_path
      expect(response).to have_http_status(200)
    end
  end
end
