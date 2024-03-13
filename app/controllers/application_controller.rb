class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user

    private 
    def authenticate_user 
        token = request.headers['Authorization']&.split(' ').last
        decoded_token = JsonWebToken.decode(token)
        
        if decoded_token 
            @current_user = User.find_by(id: decoded_token[:user_id])
        else 
            render json: {error:'Unauthorized'}, status: :unprocessable_entity
        end
    end

end
