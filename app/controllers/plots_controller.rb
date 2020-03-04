# The User controller is responsible for all plot-related methods.
class PlotsController < ApplicationController

    # Allows us to render both html and javascript with all contoller actions.
    respond_to :html, :js

    def plot_params
        params.require(:plot).permit(:category, :water, :timeSinceLastWaterLevelDecrease, :cost)
    end
  
    def id
        id = params[:id] # retrieve ID from URI route
        @plot = Plot.find(id) # look up by unique ID
    end

    def index
        @plots = Plot.all.order(id: :asc)
        if params[:plotSelected] != nil
            session[:plotSelected] = params[:plotSelected]
        end
        if session[:plotSelected] == nil
            session[:plotSelected] = "1"
            @plotSelected = "1"
        else
            @plotSelected = params[:plotSelected]? params[:plotSelected]:session[:plotSelected]
        end
        
        @plants = Plant.all.order(id: :asc)
        if params[:plantSelected] != nil
            session[:plantSelected] = params[:plantSelected]
        end
        if session[:plantSelected] == nil
            session[:plantSelected] = "1"
            @plantSelected = "1"
        else
            @plantSelected = params[:plantSelected]? params[:plantSelected]:session[:plantSelected]
        end
        # will render app/views/plots/index.<extension> by default
    end

    def show

    end
    
    def update
    
    end
    
    def plant
        temp = params[:plantSelected]? params[:plantSelected]:session[:plantSelected]
        User.first.update_attributes!({:currentPlantSelected => temp})
        id = params[:id]
        plot = Plot.find id
        @plot = Plot.find params[:id]
        if plot.category == 'Empty' && User.first.gold > Plant.find(User.first.currentPlantSelected).cost
            currGold = User.first.gold
            currGold -= Plant.find(User.first.currentPlantSelected).cost
            User.first.update_attributes!({:gold => currGold})
            plot.update_attributes!({:category => 'Planted'})
            plot.update_attributes!({:plantName => Plant.find(User.first.currentPlantSelected).name})
            plot.update_attributes!({:maxWater => Plant.find(User.first.currentPlantSelected).maxWater})
            plot.update_attributes!({:minWater => Plant.find(User.first.currentPlantSelected).minWater})
            plot.update_attributes!({:harvestTime => Plant.find(User.first.currentPlantSelected).harvestTime})
            plot.update_attributes!({:harvestGold => Plant.find(User.first.currentPlantSelected).harvestGold})     
            plot.update_attributes!({:water => 15})########STARTING PLANT WATER###########
            timeSinceLastWaterLevelDecrease = Time.now
            @plot.timeSinceLastWaterLevelDecrease = timeSinceLastWaterLevelDecrease
            @plot.save
            timePlanted = Time.now
            @plot.timePlanted = timePlanted
            @plot.save
            flash[:notice] = "You have planted a plant"
            User.first.update_attributes!({:isPlanting => false})
        else
          flash[:warning] = "Not enough gold to purchase plant"
        end
        redirect_to plots_path
    end
    
    def buyPlot
        id = params[:id]
        plot = Plot.find id
        @plot = Plot.find params[:id]
        currGold = User.first.gold
        if plot.category == 'Unowned' && currGold >= 20
            plot.update_attributes!({:category => 'Empty'})
            currGold -= 20
            User.first.update_attributes!({:gold => currGold}) 
            flash[:notice] = "You have purchased the plot"
        elsif plot.category == 'Unowned' && currGold < 20
            User.first.update_attributes!({:gold => currGold}) 
            flash[:warning] = "Not enough gold to purchase plot"
        end
        
        redirect_to plots_path
    end
    
    def buyPlant
        User.first.update_attributes!({:isPlanting => true})
        redirect_to plots_path
    end
    
    def exitPlantShop
        User.first.update_attributes!({:isPlanting => false})
        redirect_to plots_path
    end
    
    def water
        id = params[:id]
        plot = Plot.find id
        @plot = Plot.find params[:id]
        waterAmt = if Time.now.hour < 12; (-5) else (3) end
        if plot.category == 'Planted'
            currWater = plot.water + 5 #######SET WATER INCREASE AMOUNT VIA BUTTON CLICK HERE#########
            plot.update_attributes!({:water => currWater})
            flash[:notice] = "You have watered the plant"
            #Check if plant is dead
            if currWater < plot.minWater or currWater > plot.maxWater
              plot.update_attributes!({:category => 'Dead'})
              plot.update_attributes!({:readyToHarvest => 'Yes (Dead)'})
            end
            #End of "check if plant is dead" section
            if plot.category == 'Planted'
            #Check if water level needs to go down
            if Time.now.to_f >= (plot.timeSinceLastWaterLevelDecrease + plot.secondsWaterTakesToDecreaseOneLevel)
              currWater += waterAmt * ((Time.now.to_f-plot.timeSinceLastWaterLevelDecrease)/plot.secondsWaterTakesToDecreaseOneLevel)
              plot.update_attributes!({:water => currWater})
              timeSinceLastWaterLevelDecrease = Time.now
              @plot.timeSinceLastWaterLevelDecrease = timeSinceLastWaterLevelDecrease
              @plot.save
            end
            #End "Check if water level needs to go down"
            end
            #Check if ready to harvest
            temp = plot.harvestTime - (Time.now.to_i - plot.timePlanted.to_i)
            plot.update_attributes!({:timeNeededBeforeHarvest => temp})
            if Time.now.to_f >= (plot.timePlanted + plot.harvestTime)
                plot.update_attributes!({:readyToHarvest => 'Yes'})
            end
            #End "Check if ready to harvest"
            #Check if plant is dead
            currWater = plot.water
            if currWater < plot.minWater or currWater > plot.maxWater
              plot.update_attributes!({:category => 'Dead'})
              plot.update_attributes!({:readyToHarvest => 'Yes (Dead)'})
            end
            #End of "check if plant is dead" section
        end
        redirect_to plots_path
    end
    
    def harvest
        id = params[:id]
        plot = Plot.find id
        @plot = Plot.find params[:id]
        currGold = User.first.gold
        if plot.category == 'Dead'
            plot.update_attributes!({:category => 'Empty'})
            plot.update_attributes!({:plantName => 'No Plant'})
            plot.update_attributes!({:water => 0})
            plot.update_attributes!({:readyToHarvest => 'No'})
            flash[:notice] = "You have removed the dead plant"
        end
        if plot.category == 'Planted' and plot.readyToHarvest == 'Yes'
            plot.update_attributes!({:category => 'Empty'})
            plot.update_attributes!({:plantName => 'No Plant'})
            plot.update_attributes!({:water => 0})
            plot.update_attributes!({:readyToHarvest => 'No'})
            User.first.update_attributes!({:gold => currGold += plot.harvestGold})
            flash[:notice] = "Plant was successfully harvested"
        end
        redirect_to plots_path
    end

  def refreshAttributes
    id = params[:id]
    plot = Plot.find id
    @plot = Plot.find params[:id]
    waterAmt = if Time.now.hour < 12; (3) else (-5) end
    if plot.category == 'Planted'
            #Check if water level needs to go down
            if Time.now.to_f >= (plot.timeSinceLastWaterLevelDecrease + plot.secondsWaterTakesToDecreaseOneLevel)
              currWater = plot.water
              currWater += waterAmt * ((Time.now.to_f-plot.timeSinceLastWaterLevelDecrease)/plot.secondsWaterTakesToDecreaseOneLevel)
              plot.update_attributes!({:water => currWater})
              timeSinceLastWaterLevelDecrease = Time.now
              @plot.timeSinceLastWaterLevelDecrease = timeSinceLastWaterLevelDecrease
              @plot.save
            end
            #End "Check if water level needs to go down"
            #Check if ready to harvest
            temp = plot.harvestTime - (Time.now.to_i - plot.timePlanted.to_i)
            plot.update_attributes!({:timeNeededBeforeHarvest => temp})
            if Time.now.to_f >= (plot.timePlanted + plot.harvestTime)
                plot.update_attributes!({:readyToHarvest => 'Yes'})
            end
            #End "Check if ready to harvest"
            #Check if plant is dead
            if plot.water < plot.minWater or plot.water > plot.maxWater
              plot.update_attributes!({:category => 'Dead'})
              plot.update_attributes!({:readyToHarvest => 'Yes (Dead)'})
            end
            #End of "Check if plant is dead" section
      redirect_to plots_path
    end
  end
    
end

# Todo: check if we need plot_params or id.