# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plants = [{:name => 'Hydrangea', :minWater => 10, :maxWater => 65, :secondsWaterTakesToDecreaseOneLevel => 20, :harvestGold => 18, :harvestTime => 40, :description => "Shrubs 1 to 3 meters tall", :cost => 12}, 
        {:name => 'Tulip', :minWater => 15, :maxWater => 70, :secondsWaterTakesToDecreaseOneLevel => 10, :harvestGold => 12, :harvestTime => 30, :description => "Spring-blooming perennial herbaceous bulbiferous geophytes", :cost => 8},
        {:name => 'Poppy', :minWater => 20, :maxWater => 60, :secondsWaterTakesToDecreaseOneLevel => 20, :harvestGold => 15, :harvestTime => 50, :description => "Herbaceous plants, often grown for their colourful flowers", :cost => 10},
        {:name => 'Prickly Pear Cactus', :minWater => -40, :maxWater => 30, :secondsWaterTakesToDecreaseOneLevel => 50, :harvestGold => 20, :harvestTime => 70, :description => "Edible plant grew and could be propagated by rooting its lea", :cost => 15},
        {:name => 'Aloe', :minWater => -30, :maxWater => 20, :secondsWaterTakesToDecreaseOneLevel => 44, :harvestGold => 40, :harvestTime => 90, :description => "Source of so-called aloe vera for assorted pharmaceutical purposes", :cost => 25},
        {:name => 'Lavender', :minWater => 10, :maxWater => 50, :secondsWaterTakesToDecreaseOneLevel => 20, :harvestGold => 40, :harvestTime => 50, :description => "Cultivated extensively in temperate climates as ornamental plants, culinary herbs, and also commercially for the extraction of essential oils", :cost => 30},
        {:name => 'Mint', :minWater => 15, :maxWater => 55, :secondsWaterTakesToDecreaseOneLevel => 20, :harvestGold => 30, :harvestTime => 40,:description => "Aromatic, almost exclusively perennial herbs", :cost => 20},
        {:name => 'Lily', :minWater => 10, :maxWater => 65, :secondsWaterTakesToDecreaseOneLevel => 20, :harvestGold => 15, :harvestTime => 40, :description => "Herbaceous flowering plants growing from bulbs, all with large prominent flowers", :cost => 10},
        {:name => 'Lemonvine', :minWater => -40, :maxWater => 30, :secondsWaterTakesToDecreaseOneLevel => 40, :harvestGold => 30, :harvestTime => 60, :description => "Leaves and fruits are edible, containing high quantities of protein, iron and other nutrients", :cost => 25},
        {:name => 'Morning glory', :minWater => 10, :maxWater => 60, :secondsWaterTakesToDecreaseOneLevel => 20, :harvestGold => 15, :harvestTime => 40, :description => "The seeds of many species of morning glory contain ergoline alkaloids such as the psychedelic ergonovine and ergine (LSA)", :cost => 10}]

plants.each do |plant|
  Plant.create!(plant)
end

plots = Array.new(25, {:plantName => 'No Plant', :category => 'Unowned',  :readyToHarvest => 'No', :water => 0, :minWater => 0, :maxWater => 30, :buttonBGColor => 'red', :timeSinceLastWaterLevelDecrease => 0, :timePlanted => 0, :timeNeededBeforeHarvest => 10, :secondsWaterTakesToDecreaseOneLevel => 4, :cost => 10, :harvestGold => 10, :harvestTime => 10})

plots.each do |plot|
  Plot.create!(plot)
end

users = [{:name => 'Test User', :email =>'test@test.net', :gold => 500, :currentPlotSelected => 3, :isPlanting => false, :currentPlantSelected => 1}]

users.each do |user|
  User.create!(user)
end