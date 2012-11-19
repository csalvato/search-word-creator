class ChangeDefaultValueOfWordSearchPuzzleName < ActiveRecord::Migration
  def change
		change_column :word_search_puzzles, :name, :string, default: "New Puzzle #{Time.current.strftime('%-m-%-d-%Y %l:%M %P')}"
  end
end
