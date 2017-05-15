Then(/^I should see the ([^"]*) on my location range$/) do |text|
    expect(page).to have_content(text)
end