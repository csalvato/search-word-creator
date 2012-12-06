def string_to_category_array(str)
	words = str.split("\n")
	words.each do |word|
		new_word = word.gsub(/\s+/, "").gsub(/-+/, "")
		words.delete(word) if new_word.length > 18 || !new_word.index(/\d|\./).nil?
	end
end