class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.integer :deck_id, foreign_key: true, index: true

      t.timestamps(null: false)
    end
  end
end
