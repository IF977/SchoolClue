When(/^put ([^"]*) on the ([^"]*) input$/) do |data,input|
    fill_in(input, :with => data)
end

When(/^click on the ([^"]*) button$/) do |button|
    click_button(button)
end