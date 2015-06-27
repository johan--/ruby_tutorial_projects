class MatchesController < ApplicationController
  def index
    @matches = current_user.matches.order('started_at DESC') if current_user
  end

  def show
    @match = Match.find_by(id: params[:id])
  end
end
