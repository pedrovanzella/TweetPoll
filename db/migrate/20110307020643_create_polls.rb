class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.string :title
			t.string :cached_slug
			t.integer :poller_id
			
      t.timestamps
    end
  end

  def self.down
    drop_table :polls
  end
end
