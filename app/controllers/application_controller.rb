class ApplicationController < ActionController::Base
    include ActionController::Cookies
    skip_before_action :verify_authenticity_token

    
    before_action :authorize

    

    def current_user
        User.find_by(id: session[:current_user])
    end


    private

    def authorize
        return render json: {error: "Not Authorized" }, status: :unauthorized unless session.include? :current_user
    end


    

end
