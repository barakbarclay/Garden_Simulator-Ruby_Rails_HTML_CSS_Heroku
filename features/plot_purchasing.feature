Feature: Plot purchasing
    As a user
    So that I can expand my garden
    I want to be able to purchase additional plots for my garden with in-game currency.
    
    Scenario: Succesfully purchase a plot
        Given I am in my personal garden view
        And I have enough currency to purchase a plot
        And there is at least one plot available for purchase
        When I click an unowned plot's radio selector
        Then that plot should become selected
        When I click the Buy Plot button
        Then my total currency should go down by the purchase price amount
        
    Scenario: Fail to purchase a plot (no available plots)
        Given I am in my garden view
        And I have enough currency to purchase a plot
        And there are no plots available for purchase
        Then there should be no unowned plots to buy
        
    Scenario: Fail to purchase a plot (not enough currency)
        Given I am in my garden view
        And there is at least one plot available for purchase
        And I do NOT have enough currency to purchase a plot
        Then the Buy Plot button should not be on screen