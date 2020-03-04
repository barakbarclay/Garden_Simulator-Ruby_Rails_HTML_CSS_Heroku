Given("I am on the login page") do
    visit("http://garden-simulator.herokuapp.com/login")
end

When("I enter FalseFalseFalse@False into the Email box") do
    fill_in "session[email]", with: "FalseFalseFalse@False"
end

When("I enter FalseFalseFalse into the Password box") do
    fill_in "session[password]", with: "FalseFalseFalse"
end

When("I click Log in") do
    click_button "Log in"
end

Then("the message Invalid email password combination should display") do
    expect(page).to have_content("Invalid email/password combination")
end

When("I click the sign up link") do
  click_link("Sign up now!")
end

Then("I should go to the sign up page") do
  expect(page).to have_content("Confirmation")
end

Given("I am on the sign up page") do
  visit("http://garden-simulator.herokuapp.com/signup")
end

Given("all the fields are empty") do
  all("input", text: '')
end

Then("nothing should happen") do
  expect(page).to have_content("Sign up for Garden Simulator")
end