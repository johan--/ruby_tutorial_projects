class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        flash[:success] = 'Photo was successfully created.'
        format.html { redirect_to(@photo) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
