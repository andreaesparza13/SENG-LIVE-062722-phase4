class ApplicationController < ActionController::API
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   rescue_from ActiveRecord::RecordInvalid, with: :invalid_entity

   private

   def record_not_found(error)
      render json: { message: error.message }, status: :not_found
   end

   def invalid_entity(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
   end

end
