class RecordsController < ApplicationController
  def index
    @records = Record.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
