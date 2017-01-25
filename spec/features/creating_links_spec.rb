feature 'Creating new bookmarks' do
  scenario 'adding a new bookmark' do
    visit '/links/new'
    fill_in :title, :with => 'Github'
    fill_in :url, :with => 'www.github.com'
    click_button 'Create Bookmark'
    expect(page).to have_content('Github')
    expect(page).to have_content('www.github.com')
  end
end
