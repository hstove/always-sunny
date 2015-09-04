class RemoveUnusedEpisodeFields < ActiveRecord::Migration
  def change
    remove_column :episodes, :day_of_week, :string
    remove_column :episodes, :hour_of_day, :integer
    remove_column :episodes, :time_of_hour, :integer
  end
end
