Feature: Plot Buttons
    As a user
    So that I can grow various plants
    I want to be able to interact with the plots.
    
    Scenario: Succesfully use the "Plant" button
        Given there are empty plots
        When I click an empty plot's radio selector
        Then that plot should become the selected plot
        When I click the Plant button
        Then a plant should be planted in the plot
        
    Scenario: Failure to plant a seed (no available plots)
        Given there are no empty plots available to plant a seed
        Then the Plant button should not be on screen
    
    Scenario: Successfully use the "Water" button
        Given there are plants planted
        When I click the Water button
        Then the plant should be watered
    
    Scenario: Failure to water a plant (no plants planted)
        Given there are no plants planted
        Then the Water button should not be on screen
    
    Scenario: Successfully use the "Harvest" button
        Given there are plants planted
        When I click the Harvest button
        Then the plant is removed from the plot
    
    Scenario: Failure to harvest a plant (no plants planted)
        Given there are no plants planted
        Then the Harvest button should not be on screen
    