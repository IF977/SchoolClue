Then(/^I should see the ([^"]*)$/) do |text|
    expect(page).to have_content(text)
end