def s2cat(str)
	words = str.split("\n")
	words_new = words.dup
	words.each do |word|
		new_word = word.gsub(/\s+/, "").gsub(/-+/, "")
		puts new_word
		words_new.delete(word) if new_word.length > 18 || 
															!new_word.index(/\d|\./).nil? || 
															new_word.include?("'") || 
															new_word.include?(".") || 
															new_word.include?(",") ||
															new_word.include?("!") ||
															new_word.include?(":") ||
															new_word.include?("&") ||
															new_word.include?("?")
	end
	return words_new
end