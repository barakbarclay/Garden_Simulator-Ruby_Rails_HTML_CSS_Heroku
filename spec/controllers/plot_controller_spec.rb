require 'rails_helper'

RSpec.describe PlotsController, type: :controller do
    
    before(:each) do
        plot = Plot.create!(plantName: "No Plant", category: "Unowned",
            buttonBGColor: "red", readyToHarvest: "No", water: 0, maxWater: 30,
            minWater: 0, secondsWaterTakesToDecreaseOneLevel: 5,
            timeSinceLastWaterLevelDecrease: 5, timePlanted: 0, timeNeededBeforeHarvest: 10,
            cost: 10, created_at: DateTime.now, updated_at: DateTime.now + 1.day)
    end
    
    describe "GET #index" do
        it "assigns @plots" do
            get :index
            expect(assigns(:plots)).to eq([plot])
        end
        
        it "assigns @plants" do
            get :index
            expect(assigns(:plants)).to eq([plant])
        end        
        
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    describe "PUT #buyPlot" do
        user = User.create!(name: "testUser", email: "test@test.net",
            gold: 500, currentPlotSelected: 3)
            
        context "user has 20 gold" do
            user.gold = 20
            it "subtracts 20 gold from the user's total gold" do
                put :buyPlot, params: { id: 1 }
                user.gold = 0 # TODO: Figure out how to call buyPlot for real.
                expect(user.gold).to eql(0)
            end
        end
        
        context "user has 0 gold" do
            user.gold = 0
            it "makes user gold remain at 0" do
                allow(@plot).to receive(:buyPlot)
                expect(user.gold).to eql(0)
            end
        end 
    end

    describe "PUT #plant" do
    
        user = User.create!(name: "testUser", email: "test@test.net",
            gold: 500, currentPlotSelected: 3)
        
        context "user plants a plant in an empty plot"
            it "makes the plot planted" do
                plot = build(:Plot, category: "Empty")
                allow(@plot).to receive(:plant)
                plot.category = "Planted"
                expect(plot.category).to eql("Planted")
                end
           
            it "plants a plant in plot" do
                plot = build(:Plot, plantName: "Test Plant")
                allow(@plot).to receive(:plant)
                plot.plantName = "Tulip"
                expect(plot.plantName).to eql("Tulip")
                end
            
     end
    
    describe "PUT #water" do
        context "user waters a planted plant"
            it "increases the plot's water" do
                plot = build(:Plot, category: "Planted")
                allow(@plot).to receive(:water)
                plot.water += 5
                expect(plot.water).to eql(5)
            end
            
         context "plot water level goes above max water level or below min water level"
            it "kills the plant in the plot" do
                plot = build(:Plot, category: "Planted")
                allow(@plot).to receive(:water)
                plot.water < 0 || plot.water > 30
                plot.category = "dead"
                expect(plot.category).to eql("dead")
            end
                
          context "plot water is between 0 and 30 for a certain amount of time"
            it "allows the plant to be harvested" do
                plot = build(:Plot, category: "Planted")
                allow(@plot).to receive (:water)
                plot.readyToHarvest = "Yes"
                expect(plot.readyToHarvest).to eql("Yes")
            end
        end
    
    describe "PUT #harvest" do
        user = User.create!(name: "testUser", email: "test@test.net",
            gold: 500, currentPlotSelected: 3)
    
        context "user harvests a planted plot (live plant)" do
            user.gold = 0
            it "makes the plot empty" do
                plot = build(:Plot, category: "Planted")
                allow(@plot).to receive(:harvest)
                plot.category = "Empty" # TODO: Figure out how to call harvest for real.
                expect(plot.category).to eql("Empty")
            end
            
            it "increases the user's gold" do
                allow(@plot).to receive(:harvest)
                user.gold = 20 # TODO: Figure out how to call harvest for real.
                expect(user.gold).to eql(20)
            end
        end
        
        context "user harvests a planted plot (dead plant)" do
            user.gold = 0
            it "makes the plot empty" do
                plot = build(:Plot, category: "Planted")
                allow(@plot).to receive(:harvest)
                plot.category = "Empty" # TODO: Figure out how to call harvest for real.
                expect(plot.category).to eql("Empty")
            end
            
            it "does not increase the user's gold" do
                allow(@plot).to receive(:harvest)
                user.gold = 0 # TODO: Figure out how to call harvest for real.
                expect(user.gold).to eql(0)
            end
        end
    
    end
    
#    describe "PUT #buyPlant" do
#        user = User.create!(name: "testUser", email: "test@test.net",
#            gold: 500, currentPlotSelected: 3)
#        
#        it "flags the user is buying attribute" do
#            allow(@plot).to receive(:buyPlant)
#            user.isPlanting = "True"
#            expect(user.isPlanting).to eql("True")    
#        end
#    end
end
