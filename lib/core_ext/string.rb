class String
	# Turns a category string into the SEO ready link string
	def category_to_link
		self.downcase.strip.gsub(/[^A-Za-z0-9'\- \(\)]/, '').gsub(' ', '-')
	end

	# Turn a SEO ready link string to a category string
	def link_to_category
		self.titlecase.strip.gsub('-', ' ')
	end
end