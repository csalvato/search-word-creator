# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.searchwordcreator.com"

SitemapGenerator::Sitemap.create do
  add '/faq', priority: 0.25, changefreq: 'monthly'
  add '/ask-us-pricing', priority: 0.25, changefreq: 'monthly'
  add '/contact', priority: 0.25, changefreq: 'monthly'
  add '/plans-and-pricing', priority: 0.25, changefreq: 'monthly'
  add '/purchase', priority: 0.25, changefreq: 'monthly'
  add '/signup', priority: 0.25, changefreq: 'monthly'
  add '/signin', priority: 0.25, changefreq: 'monthly'

  add '/word-search-puzzles', priority: 0.80, changefreq: 'daily'
  WordSearchPuzzle.select("DISTINCT(CATEGORY)").each do |puzzle|
    add category_path(puzzle.category.category_to_link), priority: 0.75, changefreq: 'daily'  if puzzle.category != ""
  end
  WordSearchPuzzle.find_each do |puzzle|
    add promo_puzzle_path(puzzle.category.category_to_link, puzzle.name.category_to_link), priority: 0.75, changefreq: 'monthly' if puzzle.category != ""
  end
end
