class AddStateAndStatsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :state, :string
    add_column :videos, :upload_started_at, :datetime
    add_column :videos, :upload_completed_at, :datetime
  end
end
