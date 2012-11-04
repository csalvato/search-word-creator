require 'spec_helper'
include WordSearchPuzzlesHelper

describe WordSearchPuzzlesController do

  describe WordSearchPuzzlesHelper do
    let(:word_list) { ["hello", "world", "foobar"] }
    let(:grid) { initialize_grid( grid_size = 18 ) }
    let(:solutions) { [{[0,0] => grid[0][0]}]}
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

    describe "should properly detect collisons" do
      
      specify "when there is a collision" do
        collision?(solutions = [{[0,0] => "B"}],
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_true
      end
      
      specify "when there is not a collision" do
        collision?(solutions = [{[1,1] => "A"}],
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end

      specify "when there is a collison BUT the letter is the same" do
        collision?(solutions = [{[0,0] => "A"}],
                         row = 0, 
                         col = 0, 
                         letter = "A").should be_false
      end
    end

    describe "should not overwrite already placed words" do
      before do 
        puzzle[:grid].length.times do |row|
          puzzle[:grid][0].length.times do |col|
            puzzle[:grid][row][col] = "A"
            puzzle[:solutions].push([{[row,col] => grid[row][col]}])
          end
        end
      end
      specify{ insert_into_puzzle_horiz("ABAZABA".split(''), puzzle).should be_nil }

    end

  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
