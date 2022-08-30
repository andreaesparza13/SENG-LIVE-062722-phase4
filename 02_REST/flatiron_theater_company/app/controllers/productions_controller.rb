class ProductionsController < ApplicationController
    before_action :find_prod, only: [:show, :update, :destroy]

    # GET '/productions' => show all productions
    def index 
        render json: Production.all, status: :ok
    end 

    # GET '/productions/:id' => show a single production
    def show
        render json: @prod, status: :ok
    end

    # POST '/productions' => create a new production
    def create
        render json: Production.create!(prod_params), status: :created
    end

    # PATCH '/productions/:id' => update a production
    def update
        render json: @prod.update!(prod_params), status: :ok
    end

    # DELETE '/productions/:id' => delete a production
    def destroy
        render json: @prod.destroy
    end

    private

    def find_prod
        @prod = Production.find(params[:id])
    end

    def prod_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    # def error_message
    #     render json: { error: 'production not found' }, status: :not_found
    # end

    # def invalid_entity(invalid)
    #     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    # end

end
