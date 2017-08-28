Dado(/^que eu clico em um vídeo após a busca$/) do
  page.first('#thumbnails').click
end

Então(/^eu deveria ver um modal com o video e a descrição dele$/) do
  expect(page).to have_selector('#video-details-dialog', visible: true)
end