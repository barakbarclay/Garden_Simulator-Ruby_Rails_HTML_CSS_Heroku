Feature: Plant Adding
    As a user
    So that I can add plants to my garden
    I want to be able to purchase additional plants for my garden with in-game currency.
    
    Scenario: Can click the Buy Plant button
        Given I am in my garden view
        And there is at least one owned but empty plot
        When I click an empty plot's radio button selector
        Then that plot should become the selected one
        When I click the Buy Plant button
        Then I should go to the plant shop
    
    Scenario: Can plant a plant in my garden
        Given I am in the plant shop
        And I have enough currency to purchase a plant
        When I click a plant type's radio button selector
        Then that plant type should become the selected one
        When I click the Select Plant button
        Then the current selected plant should become that plant type
        When I click the Plant button
        Then that plant type should be planted in my garden