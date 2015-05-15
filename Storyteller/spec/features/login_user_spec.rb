require 'rails_helper'

describe 'Logging in user', type: :feature do
  scenario 'signing in with omniauth' do
    visit '/'
    expect(page).to have_content 'Our cool stories'
    expect(page).to have_content 'Log In'

    click_link 'Log In'
    mock_auth_facebook
    expect(page).to have_content 'Welcome, Example User'

    click_link 'Tell one!'
    expect(page).to have_content 'New cool story'

    fill_in 'Title', with: 'Driving Story'
    fill_in 'Body', with: 'Driving on the freeway'
    click_button 'Post'
    expect(page).to have_content 'Your story was added!'
    expect(page).to have_content 'Driving Story'
    expect(page).to have_content 'Driving on the freeway'
  end
end
