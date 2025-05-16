module Api
  class UsersController < BaseController
    def index
      users = User.includes(:tasks)
      render json: users, each_serializer: UserSerializer
    end

    def show
      user = User.includes(:tasks).find(params[:id])
      render json: user, serializer: UserSerializer
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Usuario no encontrado' }, status: :not_found
    end
  end
end
