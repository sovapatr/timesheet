class EquipmentsController < ApplicationController
  require 'csv'
  
  def index
    @equipments = Equipment.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equipments }
    end
  end
  def show
    @equipment = Equipment.find(params[:id])
  end
  
  def import
    Equipment.import(params[:file])
    redirect_to equipments_path, notice: "Equipment imported."
  end
end
