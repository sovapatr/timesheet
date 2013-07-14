class EntriesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @entry = @job.entries.new(params[:entry])
    
    if !(@entry.time_r.blank? && @entry.time_o.blank?)
      myEntry = Entry.find_or_create_by_job_id_and_employee_id_and_costcode_id_and_date(@entry.job_id, @entry.employee_id, @entry.costcode_id, @entry.date)
      myEntry.time_r = @entry.time_r
      myEntry.time_o = @entry.time_o
      myEntry.save
    end
    redirect_to job_path(@job)
  end
end
