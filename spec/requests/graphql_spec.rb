require 'rails_helper'

RSpec.describe "GraphQL API", type: :request do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => "Bearer #{user.auth_token}" } }

  it "devuelve lista de usuarios" do
    create(:task, user: user)

    query = {
      query: %{
        query {
          users {
            id
            fullName
            tasks {
              title
            }
          }
        }
      }
    }

    post "/graphql", params: query, headers: headers
    expect(response).to have_http_status(:ok)
    data = JSON.parse(response.body)["data"]["users"]
    expect(data.first["tasks"].size).to eq(1)
  end
end