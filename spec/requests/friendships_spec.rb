require 'rails_helper'

RSpec.describe "Friendships", type: :request do
  describe "GET /friendships" do
    it "works! (now write some real specs)" do
      get friendships_path
      expect(response).to have_http_status(200)
    end
  end
end
