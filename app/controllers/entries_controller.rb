class EntriesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @entry = @job.entries.create(params[:entry])
    redirect_to job_path(@job)
  end
end
