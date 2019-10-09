require 'rails_helper'

RSpec.describe "ParkedVehicals", type: :request do
  describe "GET /parked_vehicals" do
    it "works! (now write some real specs)" do
      get parked_vehicals_path
      expect(response).to have_http_status(200)
    end
  end
end
