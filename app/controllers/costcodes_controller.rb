class CostcodesController < ApplicationController
  
  require 'csv'
  
  def create
    @costcode = Costcode.new(params[:costcode])
    respond_to do |format|
      if @costcode.save
        format.html { redirect_to costcodes_path, notice: 'Costcode was successfully created.' }
        format.json { render json: @costcode, status: :created, location: @costcode }
      else
        format.html { render action: "new" }
        format.json { render json: @costcode.errors, status: :unprocessable_entity }
      end 
    end
    
  end
  
  def new
    @costcode = Costcode.new
  end
  
  def index
    @costcodes = Costcode.find(:all, order: :code)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costcodes }
    end
  end
  
  def import
    Costcode.import(params[:file])
    redirect_to costcodes_path, notice: "Products imported."
  end
end
