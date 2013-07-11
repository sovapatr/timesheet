class EntriesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @entry = Entry.new(params[:entry])
    time = @entry.time_r + @ntry.time_o
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts time.inspect
    if ((@entry.time_r + @entry.time_o) > 0)
      @entry.save
    end
    redirect_to job_path(@job)
  end
end
