Dado(/^que eu clico no icone de lupa$/) do
  find('#btn-search').click
end

Então(/^eu deveria ver um campo para digitar o que estiver buscando$/) do
  expect(page).to have_selector('#search-input', visible: true)
end

Dado(/^que eu busco "([^"]*)"$/) do |arg1|
  fill_in('search-input', with: arg1)
end

Então(/^eu deveria ver a página "([^"]*)" com (\d+) resultados$/) do |page_title, result_qtt|
  expect(page).to have_title(page_title)
  expect(page).to have_selector('.md-videos-custom', count: 5)
end