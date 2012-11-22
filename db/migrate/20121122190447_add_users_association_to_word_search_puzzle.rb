class AddUsersAssociationToWordSearchPuzzle < ActiveRecord::Migration
  def change
    add_column :word_search_puzzles, :user_id, :integer
  end
end
