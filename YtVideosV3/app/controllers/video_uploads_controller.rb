class VideoUploadsController < ApplicationController
  def new
    @video_upload = VideoUpload.new
  end

  def create
    if params[:file].present? && params[:title].present? # ... and more checks here
      # upload video
    else
      # display an error (and user won't even understand what exactly is wrong)
    end
  end
end
