Given("I am in my personal garden view") do
  visit("http://garden-simulator.herokuapp.com/plots")
end

Given("I have enough currency to purchase a plot") do
  @gold = 20
end

Given("there is at least one plot available for purchase") do
  @unowned_plots = 1
end

When("I click an unowned plot's radio selector") do
  within(first('div', class:'unownedPlot')) do
    choose(:'plotSelected_1')
  end
  
end

Then("that plot should become selected") do
  first('div', class:'unownedPlot').has_checked_field?(:checked)
end

When("I click the Buy Plot button") do
  click_link('Buy Plot')
end

Then("my total currency should go down by the purchase price amount") do
  @gold.should == 0
end

Given("there are no plots available for purchase") do
  @unowned_plots = 0
  
  # TODO: iterate through and change all plot categories to "Empty"

end

Then("there should be no unowned plots to buy") do
  @unowned_plots
  .should == 0
  #expect(page).not_to have_content("Unowned")
end

Given("I do NOT have enough currency to purchase a plot") do
  @gold = 0
end

Then("the Buy Plot button should not be on screen") do
  # Checks if button exists and is disabled.
  expect(page).to_not have_button('Buy Plot')
end