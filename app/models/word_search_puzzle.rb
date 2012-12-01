# == Schema Information
#
# Table name: word_search_puzzles
#
#  id            :integer          not null, primary key
#  name          :string(255)      default("New Puzzle 11-19-2012  2:08 pm"), not null
#  times_printed :integer          default(0), not null
#  words         :text             default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  grid_width    :integer          default(18)
#  grid_height   :integer          default(18)
#  user_id       :integer
#  category      :string(255)      default("")
#

class WordSearchPuzzle < ActiveRecord::Base
	VALID_WORD_REGEX = /\A[A-Z a-z-]+\z/

	belongs_to :user

  serialize :words, Array
  attr_accessible :name, :words, :grid_width, :grid_height

  before_validation :sanitize_words
	
  validates :name, presence: true, length: { maximum: 50 }
  validates :grid_width, presence: true, numericality: { greater_than: 5, less_than: 19 }
  validates :grid_height, presence: true, numericality: { greater_than: 5, less_than: 19 }

  validates_each :words do |record, attr, words|
  	problems = ''
  	if !words.empty?
			words.each do |word|
				word = word.gsub(/\s+/, "") # strip out all whitespace
				word = word.gsub(/-+/, "") # strip out all hyphens
				if word.scan(VALID_WORD_REGEX).empty?
					problems << "can only contain letters, spaces and hyphens."
				elsif !record.grid_height.nil? && !record.grid_width.nil? &&
					    (word.length > record.grid_height || word.length > record.grid_width)
					problems << "#{word} is too long for a puzzle of this size.\n"
				end
			end
  	else
			problems = 'At least one word is required.'
			record.words = '' #Reset words for viewing purposes.
  	end
  	if problems != ''
  		record.errors.add(:words, problems)
  	end
  end	

	private
		def sanitize_words
			self.words = [] if self.words.empty?
			self.words.each do |word|
				word.upcase!
				word.strip!
			end
			self.words.delete_if{ |word| word.blank? }
		end
end
