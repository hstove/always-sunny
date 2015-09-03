class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :season
      t.integer :number
      t.text :description
      t.string :title
      t.string :day_of_week
      t.integer :hour_of_day
      t.integer :time_of_hour
      t.integer :length
      t.datetime :air_date
      t.string :director
      t.text :poster_url
      t.float :imdb_rating

      t.timestamps null: false
    end
  end
end
