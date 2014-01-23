class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :video_url
      t.string  :file_type
      t.integer :file_size

      t.timestamps
    end
  end
end
