class CreateDecks < ActiveRecord::Migration
  def change

    create_table :decks do |t|
      t.string :subject
      t.integer :creator_id, default: 0

      t.timestamps
    end
  end
end
