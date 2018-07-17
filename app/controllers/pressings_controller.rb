class PressingsController < ApplicationController

  before_action :check_for_login, :only => [:new, :create]

  def index
    @pressings = Pressing.all
    # render :pressings_path
  end

  def album_index
    @album = Album.find params[:album_id]
    @pressings = @album.pressings
    render :index
  end

  def show #dont know if i want a show function, probably only want them to show FROM the album page, users can click a link to view different pressings?
    @pressing = Pressing.find params[:id]
  end

  def new #want to use scraper or api to get this anyways?
    @pressing = Pressing.new
  end

  def create #wont need this if i us api or scraper??
    pressing = Pressing.create
    pressing_params
    redirect_to pressing
  end

  def edit #wont need/cant have if have api or scraper
    @pressing = Pressing.find params[:id]
  end

  def update #wont have/cant use if have scraper??
    @pressing = Pressing.find params[:id]
    pressing.update
    pressing_params
    redirect_to pressing
  end

  def destroy
    @pressing.find params[:id]
    pressing.destroy
    redirect_to pressing_path
  end

  private  # wouldnt need if using scraper as no one would ever be able to enter their own pressing info it would just come from data scraped.
  def pressing_params
    params.require(:pressing).permit(:year, :limited, :color, :weight, :gatefold, :remastered, :quantity_pressed, :virgin_vinyl, :lp_qty, :image)
  end



end
