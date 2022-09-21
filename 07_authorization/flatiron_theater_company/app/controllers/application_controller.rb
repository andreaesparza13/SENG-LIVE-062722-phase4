class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authenticate_user

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

     def render_not_found(error)
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 

    def authenticate_user
        render json: { errors: "Not Authorized" }, status: :unauthorized unless current_user
    end

    def is_authorized? 
        permitted = current_user.admin?
        render json: { errors: "User does not have admin permission" }, status: :forbidden unless permitted
    end
end
