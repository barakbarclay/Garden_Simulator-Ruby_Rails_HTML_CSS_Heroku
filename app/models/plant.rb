# The Plant model is responsible for acting as a blueprint to all plant types.
class Plant < ActiveRecord::Base

    # Plant attribute validation.
    validates_presence_of :name, :minWater, :maxWater, 
        :secondsWaterTakesToDecreaseOneLevel, :harvestGold, :harvestTime,
        :description, :cost

end
