class BuildingsController < ApplicationController

    def index
        @buildings = Building.all
    end

    def show
        @building = Building.find(params[:id])
    end

    # def edit

    # end

    # def update

    # end

    #private

    # def build_params
    #     params.require(:building).permit(:name, :)
    # end
end