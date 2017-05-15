Given(/^I am on the ([^"]*) page$/) do |place|
  visit "/keeper/#{place}"
end