Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I follow "([^"]*)"$/) do |link|
# puts '===' * 30
# puts link.inspect
  click_link link
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.has_content?(arg1)
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
