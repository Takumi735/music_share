class TracksController < ApplicationController
  def search
    if params[:query].present?
      @tracks = RSpotify::Track.search(params[:query])
    else
      @tracks = []
    end
  end
end
