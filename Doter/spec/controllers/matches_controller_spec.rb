require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

  describe 'GET index' do
    it 'is successful' do
      get :index

      expect(response).to be_success
    end
  end

end
