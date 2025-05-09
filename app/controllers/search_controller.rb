class SearchController < ApplicationController
  def index
    keyword = params[:query].present? ? params[:query] : "a"
    search_type = params[:search_type]
    page = params[:page].to_i
    offset = page * 20
    limit = 20

    if search_type == "artist"
      @artists = RSpotify::Artist.search(keyword, limit: limit, offset: offset)
      @tracks = []
    elsif search_type == "track"
      @tracks = RSpotify::Track.search(keyword, limit: limit, offset: offset)
      @artists = []
    else
      @artists = []
      @tracks = []
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
