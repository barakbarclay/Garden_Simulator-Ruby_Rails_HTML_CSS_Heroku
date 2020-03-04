require 'rails_helper'

RSpec.describe Plant, type: :model do
  
    subject { described_class.new(
    name: "Generic Plant", minWater: 0, maxWater: 100,
    secondsWaterTakesToDecreaseOneLevel: 10, harvestGold: 20, harvestTime: 30,
    description: "This is a plant. Plant it.", cost: 10)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a minimum water amount" do
    subject.minWater = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a maximum water amount" do
    subject.maxWater = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a seconds until water decreases attribute" do
    subject.secondsWaterTakesToDecreaseOneLevel = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a harvest gold amount" do
    subject.harvestGold = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a harvest time" do
    subject.harvestTime = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a cost" do
    subject.cost = nil
    expect(subject).to_not be_valid
  end
  
end
