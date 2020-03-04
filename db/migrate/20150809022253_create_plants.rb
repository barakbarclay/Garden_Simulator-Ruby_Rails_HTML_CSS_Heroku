# Migration responsible for re-creating the plants table
class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |table|
      table.string :name
      table.integer :minWater
      table.integer :maxWater
      table.text :description
      table.integer :cost
      table.integer :harvestTime
      table.integer :harvestGold
      table.integer :secondsWaterTakesToDecreaseOneLevel
      # Add fields that let Rails automatically keep track of timestamps
      table.timestamps
    end
  end
end
