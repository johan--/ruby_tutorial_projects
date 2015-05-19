require 'rails_helper'

describe 'Signing in and posting a comment', type: :feature do
  it 'singing in' do
    visit '/'
    expect(page).to have_content 'Welcome to our mini-chat!'
    expect(page).to have_content 'Sign in to Twitter'

    mock_auth_facebook
    click_link 'Sign in to Facebook'
    expect(page).to have_content 'Hello, mockuser!'
  end
end
