class ExtraController < ApplicationController
  def create
    @extra = Extra.new(params[:extra])
    respond_to do |format|
      if @extra.save
        format.html { redirect_to costcodes_path, notice: 'Costcode was successfully created.' }
        format.json { render json: @extra, status: :created, location: @costcode }
      else
        format.html { render action: "new" }
        format.json { render json: @extra.errors, status: :unprocessable_entity }
      end 
    end
    
  end
  
  def new
    @extra = Extra.new
  end
  
  def index
    @extras = Extra.find(:all, order: :code)
  end
end
