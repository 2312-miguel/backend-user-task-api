require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => "Bearer #{user.auth_token}" } }

  describe "GET /index" do
    it "returns http success" do
      get "/api/users", headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/users/#{user.id}", headers: headers
      expect(response).to have_http_status(:success)
    end
  end
end