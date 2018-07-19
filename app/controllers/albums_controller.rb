class AlbumsController < ApplicationController

  before_action :check_for_login, :only => [:new, :create]

  def index #here trying to order albums on index page in alphabetical order
    @albums = Album.all.order(:title)
  end

  def show
    @album = Album.find params[:id]
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.create album_params
    cloudinary = Cloudinary::Uploader.upload( params[ "album" ][ "image" ] )
    album.image = cloudinary["url"]
    album.save
    redirect_to album
  end

  def edit
    @album = Album.find params[:id]
  end

  def update
    album = Album.find params[:id]
    #upload file
    cloudinary = Cloudinary::Uploader.upload( params[ "album" ][ "image" ] )
    #replace params image with cloudinary url
    params[:album][:image]=cloudinary["url"]
    album.update album_params
    redirect_to album
  end

  def destroy
    album = Album.find params[:id]
    album.destroy
    redirect_to albums_path
  end

  private
  def album_params
    params.require(:album).permit(:title, :artist_id, :date, :tracks, :image) #wasnt sure if i should have included artist id here
  end
end
