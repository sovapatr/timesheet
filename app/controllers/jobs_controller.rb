class JobsController < ApplicationController
  
  def index
    @jobs = Job.all(order: :start_date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end
  
  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
    @job_weeks = Entry.where(job_id: @job.id).group_by{ |u| u.date.beginning_of_week(start_day = :sunday) }
    @date = params[:day] ? Date.parse(params[:day]) : Date.today
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end
  
  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new
    3.times do
      job_costcode = @job.job_costcodes.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end
  
  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:notice] = "Successfully created job."
      redirect_to @job
    else
      render :action => 'new'
    end
  end
  
   # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

    # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end 
  
end
