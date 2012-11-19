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

require 'spec_helper'

describe WordSearchPuzzle do
  let(:puzzle) { FactoryGirl.create(:word_search_puzzle) }
  subject { puzzle }
	
	it { should respond_to(:name) }
	it { should respond_to(:times_used) }
	it { should respond_to(:words) }
	it { should respond_to(:grid_width) }
	it { should respond_to(:grid_height) }

	it "should not have time_used as an accessible attribute" do
		puzzle.class.accessible_attributes.include?(:time_used).should be_false
	end

	it "words should be an array" do
		puzzle.words.should be_kind_of(Array)
	end
	
	describe "when name is blank" do
		before { puzzle.name = ""}
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { puzzle.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when words array" do
		describe "is an empty array" do
			before { puzzle.words = [] }
			it { should_not be_valid }
		end

		describe "has blank entries" do
			before do
			  puzzle.words = ["TEST", ""]
			  puzzle.save!
			end

			it { should be_valid }
			specify { puzzle.words.should == ["TEST"] }
		end

		describe "is too large for the grid" do
			before do
			  puzzle.words = [ "a" * 20 ]
			  puzzle.grid_width = puzzle.grid_height = 10
			end

			it { should_not be_valid }
		end
		
		describe "has only uppercase words without spaces" do
			before { puzzle.words = ["A" * 10] }
			
			it { should be_valid }
		end

		describe "has uppercase words with spaces" do
			before { puzzle.words = ["A " * 10] }
			
			it { should be_valid }
		end

		describe "has lowercase words with without spaces" do
			before { puzzle.words = ["a" * 10] }
			
			it { should be_valid }
		end

		describe "has lowercase words with with spaces" do
			before { puzzle.words = ["a " * 10] }
			
			it { should be_valid }
		end

		describe "has words with leading or trailing whitespace" do
			before { puzzle.words = ["A " * 10] }
			
			it { should be_valid }
		end

		describe "has words with hyphens or underscores" do
			before { puzzle.words = ["A-" * 10] }
			
			it { should be_valid }
		end

		describe "has words with characters other than letters or hypens" do
			before { puzzle.words = ["\_\!\@\#\$\]\%", "\^\&\*\(\)\{\}"] }
			
			it { should_not be_valid }
		end

	end

	describe "grid parameters" do
		describe "should not be valid" do
			describe "when grid_width is nil" do
				before { puzzle.grid_width = nil }
				it { should_not be_valid }
			end

			describe "when grid_height is nil" do
				before { puzzle.grid_height = nil }
				it { should_not be_valid }
			end

			describe "when grid_width is too large" do
				before { puzzle.grid_width = 100 }
				it { should_not be_valid }
			end

			describe "when grid_height is too large" do
				before { puzzle.grid_height = 100 }
				it { should_not be_valid }
			end

				describe "when grid_width is too small" do
				before { puzzle.grid_width = 2 }
				it { should_not be_valid }
			end

			describe "when grid_height is too small" do
				before { puzzle.grid_height = 2 }
				it { should_not be_valid }
			end
		end
	end
end
