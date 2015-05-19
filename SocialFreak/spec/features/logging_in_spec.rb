require 'rails_helper'

describe 'Loggin in from Omniauth', type: :feature do
  it 'valid hash works for twitter' do
    visit '/'
    expect(page).to have_content 'Twitter'
    mock_auth_twitter
    click_link 'Twitter'
    expect(page).to have_content 'Welcome, mockuser!'
    expect(page).to have_content 'Log Out'
    click_link 'Log Out'
    expect(page).to have_content 'See you!'
  end

  it 'valid hash works for facebook' do
    visit '/'
    expect(page).to have_content 'Facebook'
    mock_auth_twitter
    click_link 'Twitter'
    expect(page).to have_content 'Welcome, mockuser!'
    expect(page).to have_content 'Log Out'
    click_link 'Log Out'
    expect(page).to have_content 'See you!'
  end
end
