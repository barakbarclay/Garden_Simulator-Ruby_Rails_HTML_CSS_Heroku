Given("there are empty plots") do
  @empty_plots = 1
end

When("I click an empty plot's radio selector") do
  within(first('div', class:'emptyPlot')) do
    choose(:'plotSelected_1')
  end
  
end

Then("that plot should become the selected plot") do
  first('div', class:'emptyPlot').has_checked_field?(:checked)
end

When("I click the Plant button") do
  click_link('Plant')
end

Then("a plant should be planted") do
  plot.category = 'Planted'
  plant.name = 'Tulip'
end

Given("there are no empty plots available to plant a seed") do
  @empty_plots = 0
end

Then("the Plant button should not be on screen") do
  expect(page).to_not have_button('Plantt')
end

Given("there are plants planted") do
  @planted_plots = 1
end

When("I click the Water button") do
  click_link('Water')
end

Then("the plant should be watered") do
  plot.water += 5
end

Given("there are no plants planted") do
 @planted_plots = 0
end

Then("the Water button should not be on screen") do
  expect(page).to_not have_button('Water')
end

When("I click the Harvest button") do
  click_link('action')
end

Then("the plant should be removed from the plot") do
  plot.category == 'Empty'
end

Then("the Harvest button should not be on screen") do
  expect(page).to_not have_button('Harvest')
end