class EmployeesController < ApplicationController
    def create_by_co
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to company_path(@employee.company.id)
        else
            redirect_to companies_path
        end
    end

    def destroy_by_co
        @company = Company.find(params[:company_id])
        @employee = Employee.find(params[:id])
        byebug
        @employee.destroy
        redirect_to company_path(@company)
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
end