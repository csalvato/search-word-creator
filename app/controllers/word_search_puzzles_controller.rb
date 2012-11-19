class WordSearchPuzzlesController < ApplicationController 
  before_filter :signed_in_user
  
  def new
  	@word_search_puzzle = WordSearchPuzzle.new
  end

  def edit
  end

  def create
		grid_size = 18
  	@word_search_puzzle = WordSearchPuzzle.new(name: params[:word_search_puzzle][:name],
  																						 words: params[:word_search_puzzle][:words].split("\r\n"),
  																						 grid_width: grid_size,
  																						 grid_height: grid_size)
 		render 'new' unless @word_search_puzzle.save
  end

  def destroy
  end
end
