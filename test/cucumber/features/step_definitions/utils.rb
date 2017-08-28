Dado(/^que eu acessei o site Ficticia Videos$/) do
  visit 'http://localhost:8080'
end

Então(/^eu deveria ver a página "([^"]*)"$/) do |page_title|
  expect(page).to have_title(page_title)
end