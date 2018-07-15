class AlbumsController < ApplicationController

  before_action :check_for_login, :only => [:new, :create]

  def index #here trying to order albums on index page in alphabetical order
    @albums = Album.all.order(params[:title])
  end

  def show
    @album = Album.find params[:id]
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.create album_params
    redirect_to album
  end

  private
  def album_params
    params.require(:album).permit(:title, :artist_id, :date, :tracks, :image) #wasnt sure if i should have included artist id here
  end
end
