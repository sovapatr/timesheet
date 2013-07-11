class EmployeesController < ApplicationController
  require 'csv'
  
  def index
    @employees = Employee.find(:all, order: :last_name)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employees }
    end
  end
  def show
    @employee = Employee.find(params[:id])
  end
  
  def import
    Employee.import(params[:file])
    redirect_to employees_path, notice: "Employees imported."
  end
end
