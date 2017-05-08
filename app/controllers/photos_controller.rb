class PhotosController < ApplicationController
  
  
  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def new
    @photo =  Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.photographer = Photographer.find(2)
    
    if @photo.save
      flash[:success] = "Uploaded successfully"
      redirect_to photos_path
      
    else
      render :new
    end
  end
  
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:success] = "Photo Updated!"
      redirect_to photos_path(@photo)
    else
      render :edit
    end
  end
  
  private
    def photo_params
      params.require(:photo).permit(:name, :caption, :picture)
    end
  
end