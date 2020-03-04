Feature: login through login page

    Scenario: Unsuccessfully log in with invalid credentials
        Given I am on the login page
        When I enter FalseFalseFalse@False into the Email box
        And I enter FalseFalseFalse into the Password box
        And I click Log in
        Then the message Invalid email password combination should display
        
    Scenario: Sign up link goes to sign up page
        Given I am on the login page   
        When I click the sign up link
        Then I should go to the sign up page
        
    Scenario: Unsuccesfully sign up by not filling in any fields
        Given I am on the sign up page
        And all the fields are empty
        Then nothing should happen