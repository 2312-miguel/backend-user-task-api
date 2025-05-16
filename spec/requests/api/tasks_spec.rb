require 'rails_helper'

RSpec.describe "API::Tasks", type: :request do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => "Bearer #{user.auth_token}" } }

  describe "GET /api/tasks" do
    it "devuelve lista de tareas" do
      create_list(:task, 3, user: user)
      get "/api/tasks", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /api/tasks" do
    it "crea una nueva tarea" do
      task_params = {
        task: {
          title: "Nueva tarea",
          status: "pending",
          due_date: "2025-05-30",
          user_id: user.id
        }
      }

      post "/api/tasks", params: task_params, headers: headers

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("Nueva tarea")
    end
  end
end
