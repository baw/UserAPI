class Api::V1::UsersController < ApplicationController
  def authenticate
    user = User.find_by_credentials(auth_params[:username], auth_params[:password])
    
    if user
      render json: { authenticated: true }
    else
      render json: { authenticated: false }, status: :unauthorized
    end
  end
  
  private
  
  def auth_params
    params.permit(:username, :password)
  end
end