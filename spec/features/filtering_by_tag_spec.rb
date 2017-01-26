require 'spec_helper'

feature 'Can filter by tag' do
  scenario 'only links tagged with bubbles' do
    visit '/links/new'
    fill_in :title, :with => 'Google'
    fill_in :url, :with => 'www.google.com'
    fill_in :tag, :with => 'search'
    click_button 'Create Bookmark'
    visit '/links/new'
    fill_in :title, :with => 'Github'
    fill_in :url, :with => 'www.github.com'
    fill_in :tag, :with => 'bubbles'
    click_button 'Create Bookmark'
    visit '/tags/bubbles'
    expect(page).to have_content('Github')
    expect(page).not_to have_content('Google')
  end
end
