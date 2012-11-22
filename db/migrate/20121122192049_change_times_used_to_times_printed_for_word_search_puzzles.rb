class ChangeTimesUsedToTimesPrintedForWordSearchPuzzles < ActiveRecord::Migration
  def change
  	rename_column :word_search_puzzles, :times_used, :times_printed
  end
end
