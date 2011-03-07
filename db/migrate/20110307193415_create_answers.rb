class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :text
			t.integer :votes
      t.integer :poll_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
