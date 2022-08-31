class ProductionsController < ApplicationController

    def index
        render json: Production.all, status: :ok
    end

    def show
        production = Production.find(params[:id])
        render json: production, status: :ok
    end

    def create
        render json: Production.create!(production_params), status: :created
    end

    def update
        render json: find_prod.update!(production_params), status: :accepted
    end

    def destroy
        find_prod.destroy
        head :no_content
    end

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    def find_prod
        @prod = Production.find(params[:id])
    end

end
