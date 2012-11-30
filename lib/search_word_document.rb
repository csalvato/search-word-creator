require "prawn/measurement_extensions"

# Subclass of Prawn::Document to create word search puzzles.
class SearchWordDocument < Prawn::Document
  attr_accessor :grid_size, :row_offset, :col_offset, :puzzle_grid, 
  							:solutions, :puzzle_grid_size, :words, :word_bank

  def initialize(opts={ puzzle_grid_size: 18, words: [], margin: @margin=0.5.in })
    super(opts)
    @puzzle_grid_size = opts[:puzzle_grid_size]
		@words = opts[:words]
		@solutions = []
    @row_offset = 0
    @col_offset = 1
		@word_bank = []
    initialize_puzzle_grid
  end

  def draw_puzzle
		define_grid(columns: @puzzle_grid_size + 2,
                rows: @puzzle_grid_size + 7)
    grid([@row_offset,@col_offset], 
         [@row_offset + @puzzle_grid_size - 1, @col_offset + @puzzle_grid_size - 1]).bounding_box do
      stroke do 
        rounded_rectangle bounds.top_left, bounds.width, bounds.height, 10
      end
    end

    rows_count = @puzzle_grid.length
    cols_count = @puzzle_grid[0].length

    rows_count.times.with_index do |row|
      cols_count.times.with_index do |col|
       grid(row + @row_offset, col + @col_offset).bounding_box do
        text @puzzle_grid[row][col], 
             size: 0.75.cm, 
             align: :center, 
             valign: :center
       end
      end
    end
  end

  def highlight_solutions
    @solutions.each do |solution|
      solution.each do |coordinates, letter|
        grid( coordinates[0] + @row_offset, coordinates[1]+ @col_offset ).bounding_box do
          rectangle bounds.top_left, bounds.width, bounds.height
          stroke
        end
      end
    end
  end

  def draw_word_bank
    columns = ['', '', '']

    @word_bank.each_with_index do |word, index|
      columns[index % 3] += word + "\n"
    end

    grid([19,1], [23,5]).bounding_box do
      text columns[0]  
    end
    grid([19,7], [23,11]).bounding_box do
      text columns[1]
    end

    grid([19,13], [23,18]).bounding_box do
      text columns[2]
    end
  end

  # Class methods to generate the word search puzzles
	#
	# @param words Array of words for the puzzle
	def generate_puzzle
		@solutions = [] # Reset solutions for each puzzle
		@word_bank = [] # Reset word_bank for each puzzle
		@words.each_with_index do |word, index| 
			insert_into_puzzle(word)
		end

		fill_grid_with_random_letters
	end

	def print_puzzle_to_console
		puts
		@puzzle_grid.each_with_index do |row, row_num|
				print " " if row_num < 10
				print row_num.inspect + " - " + row.to_s
				puts
		end
	end

	def print_solutions_to_console
		puts
		@solutions.each do |solution|
				print solution.to_s
				puts
		end
	end

	def initialize_puzzle_grid
		# Create grid of letters
		@puzzle_grid = []
		@puzzle_grid_size.times.with_index do |row|
			@puzzle_grid[row] = []
			@puzzle_grid_size.times.with_index do |column|
				@puzzle_grid[row][column] = nil
			end
		end
		return @puzzle_grid
	end

	def fill_grid_with_random_letters
		# Create the alphabet
		alphabet = ('A'..'Z').to_a

		@puzzle_grid.length.times.with_index do |row|
			@puzzle_grid[0].length.times.with_index do |column|
				@puzzle_grid[row][column] = alphabet.shuffle[0] if @puzzle_grid[row][column].nil?
			end
		end
		return @puzzle_grid
	end

	def collision?(row, col, letter)
		# Merge together existing solutions
		# This gives a hash with all grid positions that are "taken"
		all_taken_positions = {}

		@solutions.each do |solution|
			all_taken_positions.merge!(solution)
		end
		
		# Check if the position being attempted is taken
		position_value = all_taken_positions.values_at([row,col])[0]
		return true unless position_value.nil? || (position_value == letter)
		return false
	end

	def insert_into_puzzle(word)
		count = 0
		inserted = false

		while !inserted && count < 10
			roll = rand(0..3)
			if roll == 0
				inserted = insert_into_puzzle_horiz(word)
			elsif roll == 1
				inserted = insert_into_puzzle_vert(word)
			elsif roll == 2
				inserted = insert_into_puzzle_diag_up(word)
			else
				inserted = insert_into_puzzle_diag_down(word)
			end
			count += 1
		end
	end

	def insert_letter_into_puzzle(letter, row, col)
		if collision?(row, col, letter) 
			return false
		else
			@puzzle_grid[row][col] = letter
		  return true
		end
	end

	def insert_word(word, row, col)
		# Turn words into letters
		word_array = word.upcase.split('')

		word_array.delete_if {|letter| letter == " " || letter == "-" }

		solution = {}
		word_array.each_with_index do |letter, index|
			break unless 
				insert_letter_into_puzzle(letter, 
																	row[:location], 
																	col[:location])
			solution.merge!([row[:location], col[:location]] => letter)
			row[:location] += row[:increment]
			col[:location] += col[:increment]
			if index == word_array.length-1 
				@solutions.push(solution)
				@word_bank.push(word)
				return true
			end
		end
		return false
	end

	def insert_into_puzzle_horiz(word)
		max_start_column = @puzzle_grid[0].length - length_without_spaces_and_hyphens(word)
		row = rand(0..@puzzle_grid.length-1)
		col = rand(0..max_start_column)
		
		return insert_word(word, 
											  row = { location: row, increment: 0}, 
											  col = { location: col, increment: 1})
	end

	def insert_into_puzzle_vert(word)
		max_start_row = @puzzle_grid.length - length_without_spaces_and_hyphens(word)
		row = rand(0..max_start_row)
		col = rand(0..@puzzle_grid[0].length-1)
		
		return insert_word(word, 
											  row = { location: row, increment: 1}, 
											  col = { location: col, increment: 0})
	end
		
	def insert_into_puzzle_diag_down(word)
		max_start_row = @puzzle_grid.length - length_without_spaces_and_hyphens(word)
		max_start_column = @puzzle_grid[0].length - length_without_spaces_and_hyphens(word)
		row = rand(0..max_start_row)
		col = rand(0..max_start_column)
		
		return insert_word(word, 
								  row = { location: row, increment: 1}, 
								  col = { location: col, increment: 1})
	end

	def insert_into_puzzle_diag_up(word)
		min_start_row = length_without_spaces_and_hyphens(word)-1
		max_start_column = @puzzle_grid[0].length - length_without_spaces_and_hyphens(word)
		row = rand(min_start_row..@puzzle_grid.length-1)
		col = rand(0..max_start_column)	

		return insert_word(word, 
								  row = { location: row, increment: -1}, 
								  col = { location: col, increment: 1})
	end	

	def length_without_spaces_and_hyphens(word)
		stripped_word = word.gsub(/\s+/, "") # strip out all whitespace
		stripped_word = stripped_word.gsub(/-+/, "") # strip out all hyphens
		return stripped_word.length
	end

	def generate_pdf(num_puzzles, name)
		random_characters = ('a'..'z').to_a.shuffle[0..7].join
		file_name = "#{name}_#{random_characters}.pdf"
		
		num_puzzles.times.with_index do |index|
			generate_puzzle
			# Draw the puzzle page
			draw_puzzle
			draw_word_bank
			
			# Draw the solution page
			start_new_page
			draw_puzzle
			highlight_solutions
			draw_word_bank

			start_new_page unless index + 1 == num_puzzles
		end
		render_file "#{Rails.root.to_s}/tmp/#{file_name}" unless Rails.env.test?
		return file_name
	end
end
