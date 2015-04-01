Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I follow "([^"]*)"$/) do |link|
  click_link link
end

Then(/^on homepage I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I am on New Game page$/) do
  visit '/new_game'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^click on "([^"]*)"$/) do |arg1|
  click_button arg1
end

Then(/^I expect to see "([^"]*)"$/) do |arg|
  expect(page).to have_content(arg)
end

Then(/^I expect to redirect to Start Game page$/) do
  expect(current_path).to eq('/start_game')
end

Given(/^I am on Start Game page$/) do
  visit '/start_game'
end

When(/^I see a board$/) do
  coords = ['A1', 'A2', 'B1', 'B2']
  coords.each do |coord|
    expect(page).to have_content(coord)
  end
end

Then(/^I can place a ship on the board$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
