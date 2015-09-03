# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

series = Imdb::Serie.new("0472954")

series.seasons.each do |season|
  next if [0,11,12].include?(season.season_number)
  ap "Importing season #{season.season_number}"
  season.episodes.each do |episode|
    _episode = Episode.create(
      season: season.season_number,
      title: episode.title,
      number: episode.episode,
      description: episode.plot_summary,
      poster_url: episode.poster,
      director: episode.director[0],
      imdb_rating: episode.rating,
      air_date: DateTime.parse(episode.air_date),
      length: episode.length
    )
    ap _episode
  end
end
