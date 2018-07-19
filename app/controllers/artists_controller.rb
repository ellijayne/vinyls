class ArtistsController < ApplicationController

  #so below they can still view index and show page but not new or create as they're not logged in.
  before_action :check_for_login, :only => [:new, :create]
  def index
  #displaying artists in alphabetical order
    @artists = Artist.all.order(:name)
  end

  def show
    @artist = Artist.find params[:id]
  end

  def new
    @artist = Artist.new
  end

  # def create
  #   # NOTE THIS BELOW DIDNT WORK
  #   artist = Artist.create
  #   artist_params
  #   redirect_to artist_path(artist.id)

    def create
      artist = Artist.create artist_params
      cloudinary = Cloudinary::Uploader.upload( params[ "artist" ][ "image" ] )
      artist.image = cloudinary["url"]
      artist.save
      redirect_to artist
    end

  def edit
    @artist = Artist.find params[:id]
  end

  def update
    artist = Artist.find params[:id]

    cloudinary = Cloudinary::Uploader.upload( params[ "artist" ][ "image" ] )
    #replace params image with cloudinary url
    params[:artist][:image]=cloudinary["url"]
    artist.update artist_params
    redirect_to artist
  end

  def destroy
    @artist = Artist.find params[:id]
    artist.destroy
    redirect_to artist_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :image, :info)
  end


end
