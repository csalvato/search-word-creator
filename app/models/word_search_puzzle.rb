# == Schema Information
#
# Table name: word_search_puzzles
#
#  id         :integer          not null, primary key
#  name       :string(255)      default("New Puzzle"), not null
#  times_used :integer          default(0), not null
#  words      :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WordSearchPuzzle < ActiveRecord::Base
  serialize :words, Array
  attr_accessible :name, :words

end
