class SearchController < ApplicationController
  def index
    keyword = params[:query].present? ? params[:query] : "a"
    search_type = params[:search_type]

    if search_type == "artist"
      @artists = RSpotify::Artist.search(keyword)
      @tracks = []
    elsif search_type == "track"
      @tracks = RSpotify::Track.search(keyword)
      @artists = []
    else
      @artists = []
      @tracks = []
    end
  end
end
