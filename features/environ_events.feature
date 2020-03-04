Feature: Environmental Events
    As a gardener
    So that I can effectively plan for environmental conditions
    I want to experience the effects weather and climate have on various plants.
    
    Scenario: Sunny
        Given time is 12-24
        When 20 seconds have passed
        Then the water level should go down by 5
        
    Scenario: Rainy
        Given time is 0-12
        When 20 seconds have passed
        Then the water level should increase by 3