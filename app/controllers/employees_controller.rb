class EmployeesController < ApplicationController
    def index
      @employees = Employee.find(:all, order: :first_name)
    end
  def show
    @employee = Employee.find(params[:id])
  end
end
