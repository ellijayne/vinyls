class ArtistsController < ApplicationController

  #so below they can still view index and show page but not new or create as they're not logged in.
  before_action :check_for_login, :only => [:new, :create]
  def index
    #plural artists cos you want the index to display ALL. Hoping the all.order(params[:name]) will put them in alphabetica order.
    @artists = Artist.all.order(params[:name])
  end

  def show
    @artist = Artist.find params[:id]
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.create
    artist_params
    redirect_to artist
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def update
    @artist = Artist.find params [:id]
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
    params.require(:artist).permit(:name, :info, :image)
  end


end
