class WordSearchPuzzlesController < ApplicationController 
  before_filter :signed_in_user, only: [:new, :edit, :create, :destroy, :print, :download]
  before_filter :blocked_trial_user, only: [:new, :edit, :create, :destroy, :print, :download]
  
  def new
    @word_search_puzzle = WordSearchPuzzle.new
  end

  def edit
  end

  def create
  	grid_size = 18
    @words = params[:word_search_puzzle][:words].split("\r\n")
    @word_search_puzzle = current_user.word_search_puzzles.build(
  	                         name: params[:word_search_puzzle][:name],
														 words: @words,
														 grid_width: grid_size,
														 grid_height: grid_size)
 		unless @word_search_puzzle.save
      @words = @words.join("\r\n")
      render 'new'
    end
  end

  def destroy
  end

  def print
  	grid_size = 18
    num_puzzles_printed = Integer(params[:num_puzzles])
		@word_search_puzzle = WordSearchPuzzle.find(params[:word_search_puzzle_id])
    @word_search_puzzle.times_printed += num_puzzles_printed
    if @word_search_puzzle.save && current_user.subscription.save
  		pdf = SearchWordDocument.new(words: @word_search_puzzle.words,
                                   puzzle_grid_size: grid_size)
      @file_name = pdf.generate_pdf(num_puzzles_printed,
  																	current_user.name)
    end
  end

  def download
    send_file "#{Rails.root.to_s}/tmp/#{params[:file_name]}.pdf"
  end

  def promo_puzzle
    @category = params[:category]
    @puzzle_name = params[:name].link_to_category
    @words = WordSearchPuzzle.find_by_category_and_name(@category.link_to_category, @puzzle_name).words
  end

  def index
    @puzzles_with_category = WordSearchPuzzle.select("DISTINCT(CATEGORY)")
  end

  def category
    @category = params[:category]
    @puzzles = WordSearchPuzzle.find_all_by_category(@category.link_to_category)
  end

  private
    def blocked_trial_user
      render 'blocked' if !current_user.subscription.paid_user? && !current_user.subscription.trial_user?
    end
end
