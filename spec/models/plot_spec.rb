require 'rails_helper'

RSpec.describe Plot, :type => :model do

  subject { described_class.new(
    plantName: "No Plant", category: "Unowned", buttonBGColor: "red", readyToHarvest: "No",
    water: 0, maxWater: 30, minWater: 0, secondsWaterTakesToDecreaseOneLevel: 5,
    timeSinceLastWaterLevelDecrease: 5, timePlanted: 0, timeNeededBeforeHarvest: 10,
    cost: 10, created_at: DateTime.now, updated_at: DateTime.now + 1.day)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a plant name" do
    subject.plantName = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a button background color" do
    subject.buttonBGColor = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a ready to harvest flag" do
    subject.readyToHarvest = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a current water level" do
    subject.water = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a maximum water level" do
    subject.maxWater = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a minimum water level" do
    subject.minWater = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a seconds until water decreases attribute" do
    subject.secondsWaterTakesToDecreaseOneLevel = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a time since last water level decrease counter" do
    subject.timeSinceLastWaterLevelDecrease = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a time planted attribute" do
    subject.timePlanted = nil
    expect(subject).to_not be_valid  
  end
  
  it "is not valid without a time needed before harvest attribute" do
    subject.timeNeededBeforeHarvest = nil
    expect(subject).to_not be_valid 
  end
  
  it "is not valid without a cost attribute" do
    subject.cost = nil
    expect(subject).to_not be_valid 
  end
  
end
