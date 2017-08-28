title = ''
Dado(/^que eu clico no primeiro vídeo relacionado$/) do
  sidebar = page.find('#scroll')
  thumbnails = sidebar.first('#thumbnails')
  title = thumbnails.find('.md-title-videos').text
  page.first('#thumbnails').click
end

Então(/^eu deveria ver o vídeo de forma clara$/) do
  featured_section = page.find('#related-description')
  expect(featured_section).to have_selector('.detail-title', text: title.chomp('...'), exact: false)
  
end