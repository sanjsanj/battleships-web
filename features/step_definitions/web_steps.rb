Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I follow "([^"]*)"$/) do |link|
# puts '===' * 30
# puts link.inspect
  click_link link
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.has_content?("What's your name?")
end
