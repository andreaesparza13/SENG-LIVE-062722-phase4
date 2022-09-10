class UsersController < ApplicationController
    def show 
        # user = User.find(params[:id])
        # render json: user, status: :ok
        if current_user
            render json: current_user
        else
            render json: { error: "No current session stored" }, status: :unauthorized
        end
    end 

    def create 
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end
    
    private 

    def user_params
        params.permit(:name, :email)
    end 
end
