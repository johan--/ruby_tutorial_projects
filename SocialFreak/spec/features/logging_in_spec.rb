require 'rails_helper'

describe 'Loggin in from twiiter', type: :feature do
  it 'valid hash works' do
    visit '/'
    expect(page).to have_content 'Twitter'
    mock_auth_twitter
    click_link 'Twitter'
    expect(page).to have_content 'Welcome, mockuser!'
    expect(page).to have_content 'Log Out'
    click_link 'Log Out'
  end
end
