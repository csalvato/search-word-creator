class CreateWordSearchPuzzles < ActiveRecord::Migration
  def change
    create_table :word_search_puzzles do |t|
      t.string :name, default: "New Puzzle", null: false
      t.integer :times_used, default: 0, null: false
      t.text :words, default: "", null: false

      t.timestamps
    end
  end
end
