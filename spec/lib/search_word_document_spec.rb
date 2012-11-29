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
    let(:word_list) { ["hello", "world", "foobar"] }
    let(:grid) { SearchWordDocument.initialize_grid( grid_size = 18 ) }
    let(:solutions) { [{[0,0] => "A"}]}
    let(:puzzle) { {grid: grid, solutions: solutions} }
    
    it "should not raise an error when inserting a horizontal word into a puzzle" do
      100.times do 
        expect do
          SearchWordDocument.insert_into_puzzle_horiz("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a vertical word into a puzzle" do
      100.times do 
        expect do
          SearchWordDocument.insert_into_puzzle_vert("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a diagonal-up word into a puzzle" do
      100.times do 
        expect do
          SearchWordDocument.insert_into_puzzle_diag_up("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when inserting a diagonal-down word into a puzzle" do
      100.times do 
        expect do
          SearchWordDocument.insert_into_puzzle_diag_down("foobar".split(''), puzzle)
        end.to_not raise_error      
      end
    end

    it "should not raise an error when generating puzzles" do
      100.times do
        expect do
          SearchWordDocument.generate_puzzle(word_list, puzzle[:grid].length)
        end.to_not raise_error
      end
    end

    describe "when creating a PDF" do
      let(:puzzle_for_pdf) { SearchWordDocument.generate_puzzle(['hello', 'world', 'foo'], 18) }

      it "should not generate an error" do
        expect { SearchWordDocument.generate_pdf(word_list, grid.length, 1, "Chris Salvato") }.to_not raise_error
      end
    end

    describe "should properly detect collisons" do
      
      specify "when there is a collision" do
        SearchWordDocument.collision?(solutions = [{[0,0] => "B"}],
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_true
      end
      
      specify "when there is not a collision" do
        SearchWordDocument.collision?(solutions = [{[1,1] => "A"}],
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end

      specify "when there is a collison BUT the letter is the same" do
        SearchWordDocument.collision?(solutions = [{[0,0] => "A"}],
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end
    end

    describe "when handling collisons" do
      before do 
        solutions = {}
        puzzle[:grid].length.times do |row|
          puzzle[:grid][0].length.times do |col|
            puzzle[:grid][row][col] = "A"
            solutions.merge!({[row,col] => grid[row][col]})
          end
        end
        puzzle[:solutions] = [solutions]
      end
			
			specify{ SearchWordDocument.insert_letter_into_puzzle(letter = "B", 
																				 row = 0,
																				 col = 0,
																				 puzzle).should be_false }
			specify{ SearchWordDocument.insert_letter_into_puzzle(letter = "A", 
																				 row = 0,
																				 col = 0,
																				 puzzle).should be_true }
      
      specify{ SearchWordDocument.insert_into_puzzle_horiz("ABAZABA".split(''), puzzle).should be_false }
      specify{ SearchWordDocument.insert_into_puzzle_vert("ABAZABA".split(''), puzzle).should be_false }
      specify{ SearchWordDocument.insert_into_puzzle_diag_up("ABAZABA".split(''), puzzle).should be_false }
      specify{ SearchWordDocument.insert_into_puzzle_diag_down("ABAZABA".split(''), puzzle).should be_false }
    end

    describe "when inserting a word" do
      before do
        puzzle[:grid].length.times do |row|
          puzzle[:grid][row][0] = "A"
        end
        puzzle[:solutions] = []
      end
      
      describe "that has no spaces" do
        before do
          @word_status = SearchWordDocument.insert_word("FOOBAR".split(''), 
                            row = { location: 0, increment: 1}, 
                            col = { location: 0, increment: 0},
                            puzzle ) 
        end
        let(:expected_solution){ [{[0, 0]=>"F", 
                                  [1, 0]=>"O", 
                                  [2, 0]=>"O", 
                                  [3, 0]=>"B",
                                  [4, 0]=>"A",
                                  [5, 0]=>"R" }] }
        
        specify { puzzle[:solutions].should == expected_solution }
        specify { @word_status.should be_true}
        describe "it should not place an overlapping word" do
          specify { SearchWordDocument.insert_word("FOOBAZ".split(''), 
                              row = { location: 0, increment: 1}, 
                              col = { location: 0, increment: 0},
                              puzzle).should be_false }
        end
      end

      describe "that has spaces" do
        before do
          @word_status = SearchWordDocument.insert_word("FOO BAR".split(''), 
                            row = { location: 0, increment: 1}, 
                            col = { location: 0, increment: 0},
                            puzzle ) 
        end
        let(:expected_solution){ [{[0, 0]=>"F", 
                                   [1, 0]=>"O", 
                                   [2, 0]=>"O", 
                                   [3, 0]=>"B",
                                   [4, 0]=>"A",
                                   [5, 0]=>"R" }] }
        
        specify { puzzle[:solutions].should == expected_solution }
        specify { @word_status.should be_true}
      end
    end

  end