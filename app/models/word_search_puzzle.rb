# == Schema Information
#
# Table name: word_search_puzzles
#
#  id          :integer          not null, primary key
#  name        :string(255)      default("New Puzzle"), not null
#  times_used  :integer          default(0), not null
#  words       :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  grid_width  :integer          default(18)
#  grid_height :integer          default(18)
#

class WordSearchPuzzle < ActiveRecord::Base
  serialize :words, Array
  attr_accessible :name, :words, :grid_width, :grid_height

  validates :name, presence: true, length: { maximum: 50 }
  validates :grid_width, presence: true, numericality: { greater_than: 5, less_than: 19 }
  validates :grid_height, presence: true, numericality: { greater_than: 5, less_than: 19 }
  validates_each :words do |record, attr, words|
  	problems = ''
  	if !words.empty?
			words.each do |word|
				word.gsub(/\s+/, "") # strip out all whitespace
				if word.blank?
					problems << "Blank words are not allowed."
				end
			end
  	else
			problems = 'At least one word is required.'
  	end
  	record.errors.add(:words, problems) if problems != ''
  end	
end
