class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
          
            params[:company][:offices_attributes].each  do |k,office_hash|
                @company.offices << Office.create(building_id: office_hash["id"], floor: office_hash["offices"][1].to_i)
            end
            redirect_to company_path(@company.id)
        else
            render :new
        end 
    end

    private

    def company_params
        params.require(:company).permit(:name)
    end
end