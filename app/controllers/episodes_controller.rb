class EpisodesController < ApplicationController
  def index
    @episodes = Episode.where.not(starts_at: nil)
    # TODO
  end
end
