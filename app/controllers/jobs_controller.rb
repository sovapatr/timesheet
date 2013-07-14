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
    job_costcode = @job.job_costcodes.build
    job_employee = @job.job_employees.build
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
  
  def massenter
    @date = params[:day] ? Date.parse(params[:day]) : Date.today
    @entries = Array.new
    @job = Job.find(params[:id])
    @job.employees.each do |employee|
      arr = Array.new
      @job.costcodes.each do |costcode|
        arr << @job.entries.build(job_id: :id, date: Date.today, costcode_id: costcode.id, employee_id: employee.id)
#         arr << @job.entries.find_or_initialize_by_date_and_employee_id_and_costcode_id(@date, employee.id, costcode.id)
      end
      @entries << arr
      end
  end

  def add_many_entries
    @job = Job.find(params[:id])
    # Entry.update(params[:entries].keys, params[:entries].values)
    params[:entries].each do |entry|
      myEntry = @job.entries.build(entry)
      if !(myEntry.time_r.blank? && myEntry.time_o.blank?)
        myEntry.save
      end
    end
    redirect_to @job
  end
  
  def multienter
    @job = Job.find(params[:id])
    @date = params[:day] ? Date.parse(params[:day]) : Date.today  
#    @job.employees.each do |employee|
#      @job.costcodes.each do |costcode|
#       @job.entries.find_or_initialize_by_date_and_employee_id_and_costcode_id(@date, employee.id, costcode.id)
#        myEntry = @job.entries.build(date: @date, employee_id: employee, costcode_id: costcode, time_r: 0, time_o: 0)
#      end
#    end

#    @job.employees.each do |employee|
#      @job.costcodes.each do |costcode|
        #@job.entries.build(date: @date, employee_id: employee.id, costcode_id: costcode.id)
#        @job.entries.find_or_initialize_by_date_and_employee_id_and_costcode_id(@date, employee.id, costcode.id)
#      end
#    end
    @entries = @job.entries.where(date: @date)
    
  end

  def add_many_entries_temp
    @job = Job.find(params[:id])
    @entries = params[:entries]
    @entries.each do |entry|
      if !(entry.time_r.blank? && entry.time_o.blank?)
        entry.save
      end
    end
    redirect_to @job
  end
end
