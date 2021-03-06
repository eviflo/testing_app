class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = 'Photo added!'
      redirect_to photos_path
    else
      render 'new'
    end
  end
  private

  def photo_params
    params.require(:photo, :post).permit(:title, :body, :image)
  end
end
