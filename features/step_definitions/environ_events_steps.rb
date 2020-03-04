Given("time is 12-24") do
  Time.now.hour.should > 12 and Time.now.hour.should < 24
end

Given("time is 0-12") do
  Time.now.hour.should > 0 and Time.now.hour.should < 12
end

When("20 seconds have passed") do
  @timeSinceLastWaterLevelDecrease = Time.now + 20
end

Then("the water level should go down by 5") do
  @water = 10
  @currWater = @water - 5
end

Then("the water level should increase by 3") do
  @water = 10
  @currWater = @water + 3
end