# class SessionsController < ApplicationController
#     def create
#         user = User.find_by(username: params[:session][:username].downcase)
#         if user && user.authenticate(params[:session][:password])
#           session[:user_id] = user.id
#           redirect_to user
#         else
#           render 'new'
#         end
#       end
       
#       def destroy
#         session[:user_id] = nil
#         redirect_to root_path
#       end

# end

class SessionsController < ApplicationController
    # skip_before_action :authorize, only: :login
  
    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:current_user] = user.id
        render json: user, status: :ok
      else
        render json: { error: ["invalid username and/or password"] }, status: :unauthorized
      end
    end
  
    def logout
      session.delete :current_user
    end
  
  end