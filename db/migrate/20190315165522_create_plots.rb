# Migration responsible for re-creating the plots table
class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |table|
      table.string :plantName
      table.string :category
      table.string :buttonBGColor
      table.string :readyToHarvest
      table.integer :water
      table.integer :maxWater
      table.integer :minWater
      table.integer :secondsWaterTakesToDecreaseOneLevel
      table.float :timeSinceLastWaterLevelDecrease
      table.float :timePlanted
      table.integer :timeNeededBeforeHarvest
      table.integer :harvestTime
      table.integer :harvestGold
      table.integer :cost
      table.timestamps
    end
  end
end