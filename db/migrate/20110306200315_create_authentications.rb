class CreateAuthentications < ActiveRecord::Migration
  def self.up
    create_table :authentications do |t|
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :authentications
  end
end
