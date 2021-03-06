When(/^put ([^"]*) on the ([^"]*) input$/) do |data,input|
    fill_in(input, :with => data)
end

When(/^click on the ([^"]*) button$/) do |button|
    click_button(button)
end

When(/^click on the ([^"]*) link$/) do |button|
    click_link(button)
end

When(/^([^"]*) input is empty$/) do |input|
  fill_in(input, :with => nil)
end