class EquipmentEntriesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @equipment_entry = @job.equipment_entries.create(params[:equipment_entry])
    redirect_to job_path(@job)
  end
end
