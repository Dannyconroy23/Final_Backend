
class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]
  
    def index
      render json: User.all, status: :ok
    end
  
    def show
      current_user = User.find_by(id: session[:current_user])
      render json: current_user
    end
  
    def create
      user = User.create!(user_params)
      render json: user, status: :created
    end
  
    def update
      user = User.find(params[:id])
      render json: user.update!(user_params), status: :created
    end
  
    def destroy
      user = User.find(params[:id])
      user.destroy
      head :no_content
    end
  
    private
  
    def user_params
      params.permit( :username, :password)
    end
  
  end