require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the WordSearchPuzzlesHelper. For example:
#
# describe WordSearchPuzzlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
describe WordSearchPuzzlesHelper do
    let(:word_list) { ["hello", "world", "foobar"] }
    let(:grid) { initialize_grid( grid_size = 18 ) }
    let(:solutions) { {[0,0] => grid[0][0]}}
    let(:puzzle) { {grid: grid, solutions: solutions} }

    it "should not raise an error when inserting a horizontal word into a puzzle" do
      1000.times do 
        expect do
          insert_into_puzzle_horiz("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a vertical word into a puzzle" do
      1000.times do 
        expect do
          insert_into_puzzle_vert("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a diagonal-up word into a puzzle" do
      1000.times do 
        expect do
          insert_into_puzzle_diag_up("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a diagonal-down word into a puzzle" do
      1000.times do 
        expect do
          insert_into_puzzle_diag_down("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when generating puzzles" do
      1000.times do
        expect do
          generate_puzzle(word_list, puzzle[:grid].length)
        end.to_not raise_error
      end
    end

    it "should not raise an error when creating a PDF" do
      expect { generate_pdf(puzzle) }.to_not raise_error
    end

    describe "should properly detect collisons" do
      
      specify "when there is a collision" do
        collision?(solutions = {[0,0] => "B"},
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_true
      end
      
      specify "when there is not a collision" do
        collision?(solutions = {[1,1] => "A"},
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end

      specify "when there is a collison BUT the letter is the same" do
        collision?(solutions = {[0,0] => "A"},
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end
    end

    describe "when handling collisons" do
      before do 
        puzzle[:grid].length.times do |row|
          puzzle[:grid][0].length.times do |col|
            puzzle[:grid][row][col] = "A"
            puzzle[:solutions].merge!({[row,col] => grid[row][col]})
          end
        end
      end
			
			specify{ insert_letter_into_puzzle(letter = "B", 
																				 row = 0,
																				 col = 0,
																				 puzzle).should be_false }
			specify{ insert_letter_into_puzzle(letter = "A", 
																				 row = 0,
																				 col = 0,
																				 puzzle).should be_true }
      
      specify{ insert_into_puzzle_horiz("ABAZABA".split(''), puzzle).should be_false }
      specify{ insert_into_puzzle_vert("ABAZABA".split(''), puzzle).should be_false }
      specify{ insert_into_puzzle_diag_up("ABAZABA".split(''), puzzle).should be_false }
      specify{ insert_into_puzzle_diag_down("ABAZABA".split(''), puzzle).should be_false }
    end

    describe "when inserting a word" do
      before do
        puzzle[:grid].length.times do |row|
          puzzle[:grid][row][0] = "A"
        end
        @word_status = insert_word("FOOBAR".split(''), 
                          row = { location: 0, increment: 1}, 
                          col = { location: 0, increment: 0},
                          puzzle ) 
      end
      let(:expected_solution){ {[0, 0]=>"F", 
                                [1, 0]=>"O", 
                                [2, 0]=>"O", 
                                [3, 0]=>"B",
                                [4, 0]=>"A",
                                [5, 0]=>"R" } }
      
      specify { puzzle[:solutions].should == expected_solution }
      specify { @word_status.should be_true}
      specify { insert_word("FOOBAZ".split(''), 
                          row = { location: 0, increment: 1}, 
                          col = { location: 0, increment: 0},
                          puzzle).should be_false }
      specify { puzzle[:solutions].should == expected_solution }
    end

  end