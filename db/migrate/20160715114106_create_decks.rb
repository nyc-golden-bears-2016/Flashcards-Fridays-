class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :subject
      t.integer :creator_id, foreign_key: true, index: true, default: 0

      t.timestamps(null: false)
    end
  end
end
