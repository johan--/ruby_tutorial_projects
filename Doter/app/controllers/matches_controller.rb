class MatchesController < ApplicationController
  def index
    @matches = current_user.matches.order('started_at DESC') if current_user
  end
end
