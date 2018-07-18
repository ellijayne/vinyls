class SearchController < ApplicationController
def index
   if params[:query].present?
     albums = Album.search(params[:query])
   else
     @albums = Album.all
   end
 end
end
