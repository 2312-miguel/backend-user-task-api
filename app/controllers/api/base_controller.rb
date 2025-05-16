module Api
  class BaseController < ApplicationController
    before_action :authenticate_user!

    attr_reader :current_user

    private

    def authenticate_user!
      token = request.headers['Authorization']&.split(' ')&.last
      @current_user = User.find_by(auth_token: token)

      render json: { error: 'No autorizado' }, status: :unauthorized unless @current_user
    end
  end
end