class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id, foreign_key: true, index: true
      t.integer :round_id, foreign_key: true, index: true
      t.boolean :correctness, default: false

      t.timestamps(null: false)
    end
  end
end
