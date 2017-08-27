size = 0

Dado(/^que eu clico em "([^"]*)"$/) do |button_name|
  size = page.all('.md-videos-custom').size
  click_button(button_name)
end

Então(/^eu deveria ver mais (\d+) resultados na página$/) do |qtt|
  expect(page).to have_selector('.md-videos-custom', count: Integer(qtt) + size)
end