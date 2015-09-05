class EpisodesController < ApplicationController
  def index
    @episodes = Episode.where.not(starts_at: nil).order('season, number')
  end
end
