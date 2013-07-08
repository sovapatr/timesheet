class JobCostcodesController < ApplicationController
    def create
    @job_costcode = JobCostcode.new(params[:job_costcode])
      @job = Job.find(params[:job_id])
    respond_to do |format|
      if @job_costcode.save
        format.html { redirect_to edit_job_path(params[:job_id]), notice: 'Costcode was successfully created.' }
        format.json { render json: @job_costcode, status: :created, location: @job_costcode }
      else
        format.html { render action: "new" }
        format.json { render json: @job_costcode.errors, status: :unprocessable_entity }
      end 
    end
  end
  
  def new
    @job_costcode = JobCostcodes.new
  end
end
