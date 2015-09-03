class AddTimeOfDayToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :starts_at, :datetime
  end
end
