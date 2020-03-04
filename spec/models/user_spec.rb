require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { described_class.new(
    name: "testUser", email: "test@test.net", gold: 500, currentPlotSelected: 3)}
    
  context "Validation testing" do
  
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
  
    it "is not valid without a user name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end
  
    it "is not valid without an email" do
        subject.email = nil
        expect(subject).to_not be_valid
    end
  
#   it "is not valid without a gold amount" do
#       subject.gold = nil
#       expect(subject).to_not be_valid
#   end
#  
#   it "is not valid without a current plot selected" do
#       subject.currentPlotSelected = nil
#       expect(subject).to_not be_valid
#   end
  
  end

  it "is named testUser" do
    expect(subject.name).to eql("testUser")
  end

  context "has purchased one plot" do
    it "has 480 gold" do
        subject.gold -=20 #TODO: Can this even be a thing?
        expect(subject.gold).to eql(480)
    end
  end

end
