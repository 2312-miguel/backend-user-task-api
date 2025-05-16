module Api
  class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    protected

    def current_user
      @current_user
    end
  end
end