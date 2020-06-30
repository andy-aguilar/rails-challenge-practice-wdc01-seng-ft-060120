class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end

    def show
        @company = Company.find(params[:id])
        @employee = Employee.new(company_id: @company.id)
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
          
            params[:company][:offices_attributes].each  do |k, office_hash|
                if office_hash["offices"].length > 1
                    office_hash["offices"].each do |number_string|
                        if number_string != ""
                            byebug
                            @company.offices << Office.create(building_id: office_hash["id"], floor: number_string.to_i)
                        end
                    end
                end
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