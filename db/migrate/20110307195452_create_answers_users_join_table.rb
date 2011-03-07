class CreateAnswersUsersJoinTable < ActiveRecord::Migration
  def self.up
		create_table :answers_users, :id => false do |t|
			t.integer :answer_id
			t.integer :user_id
		end
  end

  def self.down
		drop_table :answers_users
  end
end
