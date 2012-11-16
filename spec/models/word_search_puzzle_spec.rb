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

require 'spec_helper'

describe WordSearchPuzzle do
  let(:puzzle) { FactoryGirl.create(:word_search_puzzle) }
  subject { puzzle }
	
	it { should respond_to(:name) }
	it { should respond_to(:times_used) }
	it { should respond_to(:words) }

	it "words should be an array" do
		puzzle.words.should be_kind_of(Array)
	end
	
	describe "when name is too long" do
		before { puzzle.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when words is an empty array" do
		before { puzzle.words = [] }
		it { should_not be_valid }
	end

	describe "when words has blank entries" do
		before { puzzle.words = ["TEST", ""] }
		it { should_not be_valid }
	end

end
