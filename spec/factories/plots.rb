FactoryBot.define do
  factory :Plot, class:Plot do
    plantName {'Test plant'}
    category {'Emptyrspec'}
    readyToHarvest {'No'}
    water {0}
    minWater {0}
    maxWater {0}
    buttonBGColor {'red'}
    timeSinceLastWaterLevelDecrease {0}
    timePlanted {0}
    timeNeededBeforeHarvest {10}
    secondsWaterTakesToDecreaseOneLevel {5}
    cost {20}
  end
  factory :unownedPlot, class:Plot do
    plantName {'Test plant'}
    category {'Unowned'}
    readyToHarvest {'No'}
    water {0}
    minWater {0}
    maxWater {0}
    buttonBGColor {'red'}
    timeSinceLastWaterLevelDecrease {0}
    timePlanted {0}
    timeNeededBeforeHarvest {10}
    secondsWaterTakesToDecreaseOneLevel {5}
    cost {20}
  end
end