class DashboardController < ApplicationController
  def index
    @stats = Statistics.new
  end
end
