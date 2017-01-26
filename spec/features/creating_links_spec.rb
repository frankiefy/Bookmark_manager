feature 'Creating new bookmarks' do
  scenario 'adding a new bookmark' do
    visit '/links/new'
    fill_in :title, :with => 'Github'
    fill_in :url, :with => 'www.github.com'
    click_button 'Create Bookmark'
    expect(page).to have_content('Github')
    expect(page).to have_content('www.github.com')
  end
  scenario 'adding a tag' do
    visit '/links/new'
    fill_in :title, :with => 'Github'
    fill_in :url, :with => 'www.github.com'
    fill_in :tag, :with => 'useful'
    click_button 'Create Bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('useful')
  end
end
