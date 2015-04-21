class Api::V1::UsersController < ApplicationController
  def authenticate
    user = User.find_by_credentials(auth_params[:username], auth_params[:password])
    
    if user
      render json: { authenticated: true }
    else
      render json: { authenticated: false }, status: :unauthorized
    end
  end
  
  def index
    render json: User.filter_by_city_grouped_by_profession(index_params[:city])
  end
  
  private
  
  def auth_params
    params.permit(:username, :password)
  end
  
  def index_params
    params.permit(:city, :group)
  end
end