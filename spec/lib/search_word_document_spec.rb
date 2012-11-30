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
describe SearchWordDocument do
    let(:swdoc) { SearchWordDocument.new }
    let(:word_list) { ["hello", "world", "foobar"] }
    let(:grid) { swdoc.initialize_puzzle_grid }
    let(:solutions) { [{[0,0] => "A"}]}
    let(:puzzle) { {grid: grid, solutions: solutions} }
    
    it "should not raise an error when inserting a horizontal word into a puzzle" do
      100.times do 
        expect do
          swdoc.insert_into_puzzle_horiz("foobar".split(''))
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a vertical word into a puzzle" do
      100.times do 
        expect do
          swdoc.insert_into_puzzle_vert("foobar".split(''))
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a diagonal-up word into a puzzle" do
      100.times do 
        expect do
          swdoc.insert_into_puzzle_diag_up("foobar".split(''))
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a diagonal-down word into a puzzle" do
      100.times do 
        expect do
          swdoc.insert_into_puzzle_diag_down("foobar".split(''))
        end.to_not raise_error      
      end
    end

    it "should not raise an error when generating puzzles" do
      100.times do
        expect do
          swdoc.generate_puzzle(word_list)
        end.to_not raise_error
      end
    end

    describe "when creating a PDF" do
      let(:puzzle_for_pdf) { swdoc.generate_puzzle(['hello', 'world', 'foo']) }

      it "should not generate an error" do
        expect { SearchWordDocument.generate_pdf(word_list, grid.length, 1, "Chris Salvato") }.to_not raise_error
      end
    end

    describe "should properly detect collisons" do
      before do
        swdoc.solutions = [{[0,0] => "A"}]
      end
      
      specify "when there is a collision" do
        swdoc.collision?(row = 0, 
                         col = 0, 
                         letter = "B").should be_true
      end
      
      specify "when there is not a collision" do
       swdoc.collision?(row = 1, 
                        col = 1, 
                        letter = "A").should be_false
      end

      specify "when there is a collison BUT the letter is the same" do
        swdoc.collision?(row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end
    end

    describe "when handling collisons" do
      before do 
        solutions = {}
        swdoc.puzzle_grid.length.times do |row|
          swdoc.puzzle_grid[0].length.times do |col|
            swdoc.puzzle_grid[row][col] = "A"
            solutions.merge!({[row,col] => swdoc.puzzle_grid[row][col]})
          end
        end
        swdoc.solutions = [solutions]
      end
			
			specify{ swdoc.insert_letter_into_puzzle(letter = "B", 
																				 row = 0,
																				 col = 0).should be_false }
			specify{ swdoc.insert_letter_into_puzzle(letter = "A", 
																				 row = 0,
																				 col = 0).should be_true }
      
      specify{ swdoc.insert_into_puzzle_horiz("ABAZABA".split('')).should be_false }
      specify{ swdoc.insert_into_puzzle_vert("ABAZABA".split('')).should be_false }
      specify{ swdoc.insert_into_puzzle_diag_up("ABAZABA".split('')).should be_false }
      specify{ swdoc.insert_into_puzzle_diag_down("ABAZABA".split('')).should be_false }
    end

    describe "when inserting a word" do
      before do
        swdoc.puzzle_grid.length.times do |row|
          swdoc.puzzle_grid[row][0] = "A"
        end
        swdoc.solutions = []
      end
      
      describe "that has no spaces" do
        before do
          @word_status = swdoc.insert_word("FOOBAR".split(''), 
                            row = { location: 0, increment: 1}, 
                            col = { location: 0, increment: 0}) 
        end
        let(:expected_solution){ [{[0, 0]=>"F", 
                                  [1, 0]=>"O", 
                                  [2, 0]=>"O", 
                                  [3, 0]=>"B",
                                  [4, 0]=>"A",
                                  [5, 0]=>"R" }] }
        
        specify { swdoc.solutions.should == expected_solution }
        specify { @word_status.should be_true}
        describe "it should not place an overlapping word" do
          specify { swdoc.insert_word("FOOBAZ".split(''), 
                              row = { location: 0, increment: 1}, 
                              col = { location: 0, increment: 0}).should be_false }
        end
      end

      describe "that has spaces" do
        before do
          @word_status = swdoc.insert_word("FOO BAR".split(''), 
                            row = { location: 0, increment: 1}, 
                            col = { location: 0, increment: 0}) 
        end
        let(:expected_solution){ [{[0, 0]=>"F", 
                                   [1, 0]=>"O", 
                                   [2, 0]=>"O", 
                                   [3, 0]=>"B",
                                   [4, 0]=>"A",
                                   [5, 0]=>"R" }] }
        
        specify { swdoc.solutions.should == expected_solution }
        specify { @word_status.should be_true}
      end
    end

  end