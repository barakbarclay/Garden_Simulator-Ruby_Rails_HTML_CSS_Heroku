Given("I am in my garden view") do
  visit("http://garden-simulator.herokuapp.com/plots")
end

Given("there is at least one owned but empty plot") do
  @empty_plots = 1
end

When("I click an empty plot's radio button selector") do
  within(first('div', class:'emptyPlot')) do
    choose(:'plotSelected_1')
  end
end

Then("that plot should become the selected one") do
  first('div', class:'emptyPlot').has_checked_field?(:checked)
end

When("I click the Buy Plant button") do
  click_link('Buy Plant')
end

Then("I should go to the plant shop") do
    expect(page).not_to have_content("Plot State")
end

#############################################

Given("I am in the plant shop") do
    visit("http://garden-simulator.herokuapp.com/plots")
    expect(page).to have_content("Plant Shop")
end

Given("I have enough currency to purchase a plant") do
  @gold = 500
end

When("I click a plant type's radio button selector") do
  within(first('div', class:'plantShop')) do
    choose(:'plantSelected_1')
  end
end

Then("Then that plant type should become the selected one") do
  first('div', class:'plantShop').has_checked_field?(:checked)
end

When("I click the Select Plant button") do
    click_link('Select Plant')
end

Then("that plant type should become the selected one") do
    first('div', class:'plantShop').has_checked_field?(:checked)
end

Then("the current selected plant should become that plant type") do
  expect(page).to have_content("Current Selected Plant: 1")
end

Then("that plant type should be planted in my garden") do
  
end