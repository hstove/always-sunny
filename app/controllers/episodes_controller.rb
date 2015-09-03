class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
    # TODO
  end
end
