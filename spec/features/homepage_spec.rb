require 'spec_helper'

feature 'Displays hyperlinks' do
  scenario 'Homepage' do
    Link.create(url: 'http://www.google.com', title: 'Google')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('www.google.com')
    end
  end
end
