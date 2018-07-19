class SearchController < ApplicationController
def index
   if params[:query].present?
     albums = Album.search(params[:query])
   else
     @albums = Album.all
   end
 end


  def results
    @results = Artist.search(params[:query])
  end

#need reasults.html.erb file in search folder in views. then need loop to loop through all @result 


end
