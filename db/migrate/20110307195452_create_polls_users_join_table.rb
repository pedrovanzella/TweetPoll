class CreatePollsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :polls_users, :id => false do |t|
      t.integer :poll_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :polls_users
  end
end
