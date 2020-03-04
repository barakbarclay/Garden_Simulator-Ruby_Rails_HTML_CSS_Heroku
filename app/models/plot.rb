# The Plot model is responsible for acting as a blueprint to all plt types.
class Plot < ActiveRecord::Base
    
    # Plot attribute validation
    validates_presence_of :plantName, :category, :buttonBGColor, :readyToHarvest,
        :water, :maxWater, :minWater, :secondsWaterTakesToDecreaseOneLevel,
        :timeSinceLastWaterLevelDecrease, :timePlanted, :timeNeededBeforeHarvest,
        :cost
    
    def self.categories
        ['Unowned', 'Empty', 'Planted', 'Watered']
    end
end
