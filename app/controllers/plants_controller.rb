# The User controller is responsible for all plant-related methods.
class PlantsController < ApplicationController

  def plant_params
    params.require(:plant).permit(:name, :waterLevel, :description, :cost)
  end

  def id
    id = params[:id] # retrieve ID from URI route
    @plant = Plant.find(id) # look up by unique ID
  end
  
  def index
        
        # will render app/views/plots/index.<extension> by default
  end

  def show
    @plants = Plant.all
    # will render app/views/plants/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
