class AddGridSizeToWordSearchPuzzle < ActiveRecord::Migration
  def change
    add_column :word_search_puzzles, :grid_width, :integer, default: 18
    add_column :word_search_puzzles, :grid_height, :integer, default: 18
  end
end
