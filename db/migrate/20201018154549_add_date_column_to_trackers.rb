class AddDateColumnToTrackers < ActiveRecord::Migration
  def change
    add_column :trackers, :date, :date
  end
end
