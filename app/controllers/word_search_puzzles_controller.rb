class WordSearchPuzzlesController < ApplicationController 
  before_filter :signed_in_user
  
  def new
  	@word_search_puzzle = WordSearchPuzzle.new
  end

  def edit
  end

  def create
  	grid_size = 18
    @words = params[:word_search_puzzle][:words].split("\r\n")
  	@word_search_puzzle = WordSearchPuzzle.new(name: params[:word_search_puzzle][:name],
  																						 words: @words,
  																						 grid_width: grid_size,
  																						 grid_height: grid_size)
    
 		render 'new' unless @word_search_puzzle.save
  end

  def destroy
  end

  def print
  	grid_size = 18
		@word_search_puzzle = WordSearchPuzzle.find(params[:word_search_puzzle_id])
		@file_name = SearchWordDocument.generate_pdf(@word_search_puzzle.words,
																		grid_size,
																		Integer(params[:num_puzzles]),
																		current_user.name)
  end

  def download
    send_file "#{Rails.root.to_s}/tmp/#{params[:file_name]}.pdf"
  end
end
