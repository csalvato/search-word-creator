class AddCategoryToWordSearchPuzzle < ActiveRecord::Migration
  def change
    add_column :word_search_puzzles, :category, :string, default: ""
  end
end
