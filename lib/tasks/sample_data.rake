namespace :db do
  desc "Fill database with categorized puzzles"
  task populate: :environment do
    make_puzzles_for_holidays_category
    make_puzzles_for_agriculture_category
    make_puzzles_for_american_history_category

  end

  def make_puzzles_for_holidays_category
    puzzles = []
    category = "Holiday"
    puzzles.push({ name: "Christmas",
                   category: category,
                   words: ["Boxing Day", "Chimney", "Cranberries", "Drummer boy", "Egg nog", "Fruitcake", "Gifts", "Holly", "Jesus", "Jingle bells", "Kris Kringle", "Manger", "Orange", "Ornament", "Red", "Santa Claus", "Shopping", "Silent night", "Stocking", "Tree", "Turkey", "White", "Wisemen", "Wreath", "Yuletide"]
                  })
    puzzles.push({ name: "Christmas (Seasonal)",
                   category: category,
                   words: ["Blitzen", "Caroling", "Chestnuts", "Christmas Tree", "Comet", "Cupid", "Dancer", "Dasher", "Donner", "Elfs", "Frosty the Snowman", "Fruitcake", "Lumps of coal", "Mistletoe", "North Pole", "Poinsettias", "Prancer", "Presents", "Reindeer", "Rudolph", "Santa Claus", "Scrooge", "Sleigh", "Stockings", "Vixen"] 
                  })
    puzzles.push({ name: "Christmas (Traditional)",
                   category: category,
                   words: ["Advent", "Angels", "Balthazar", "Bethlehem", "Caspar", "Herod", "Immanuel", "Jesus", "Joseph", "Love", "Manger", "Mary", "Melchior", "Nativity", "Nazareth", "Noel", "Peace", "Savior", "Shepherds", "Star", "Wise Men", "frankincense", "gold", "myrrh"] 
                  })
    puzzles.push({ name: "Carpenter's Christmas",
                   category: category,
                   words: ["Ave Maria", "Carol of the Bells", "Christ Is Born", "Christmas Song", "Christmas Waltz", "Frosty the Snowman", "Good King Wenceslas", "Little Altar Boy", "O Come O Come Emmanuel", "O Holy Night", "O Holy Night", "Silent Night", "Silver Bells", "Sleigh Ride", "White Christmas", "Winter Wonderland"] 
                  })
    puzzles.push({ name: "Hanukkah",
                   category: category,
                   words: ["Altar", "Blessing", "Candles", "Chanukkah", "Doughnuts", "Dreidel", "Eight", "Gelt", "Jerusalem", "Jewish", "Kislev", "Latke", "Lights", "Maccabees", "Menorah", "Miracle", "Mitzvah", "Nightfall", "Oil", "Singing", "Songs", "Talmud", "Temple", "Tevet", "Torah"] 
                  })
    puzzles.push({ name: "New Year's Day",
                   category: category,
                   words: ["Auld Lang Syne", "Calendar", "Change", "Confetti", "Countdown", "Dick Clarke", "Fireworks", "Football", "Giant ball", "Gregorian", "Habits", "Hat", "Holiday", "January", "Kazoo", "Kiss", "Midnight", "Orange Bowl", "Otoshidamas", "Parade", "Party", "Resolution", "Times Square", "Toast", "Universal"] 
                  })
    puzzles.push({ name: "Kwanza",
                   category: category,
                   words: ["African", "Ancestry", "Candle", "Dance", "Drumming", "Feast", "First fruits", "Habari Gani", "Heritage", "Imani" "Karenga", "Kinara", "Kujichagulia", "Kuumba", "Libations", "Nia", "Principles", "Seven", "Swahili", "Ujamaa", "Ujima", "Umoja", "Uwole"] 
                  })
    puzzles.push({ name: "Frank Sinatra Christmas",
                   category: category,
                   words: ["A Baby Just Like You", "Adeste Fideles", "Ave Maria", "Christmas Dreaming", "Christmas Memories", "Jingle Bells", "Let it Snow", "Mistletoe and Holly", "Silent Night", "The Christmas Song", "The Christmas Waltz", "The First Noel", "White Christmas", "Winter Wonderland"] 
                  })
    puzzles.push({ name: "St. Valentine's Day",
                   category: category,
                   words: ["Arrow", "Candle", "Candy", "Card", "Chocolate", "Couple", "Cupid", "Dedication", "February", "Fourteenth", "Gift", "Hallmark", "Heart", "Jewelry", "Love", "Notes", "Ode", "Perfume", "Poem", "Red", "Romance", "Roses", "Saint", "Secret", "Valentine"] 
                  })
  
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      new_puzzle.words = puzzle[:words]
      new_puzzle.save!
    end
  end

  def make_puzzles_for_agriculture_category
    puzzles = []
    category = "Agriculture"
    puzzles.push({ name: "Farm Machinery",
                   category: category,
                   words: ["air seeder", "backhoe", "baler", "bulldozer", "chisel plow", "combine harvester", "corn harvester", "cultivator", "digger", "disk harrow", "front end loader", "harrow", "hay rake", "huller", "manure spreader", "mower", "seed drill", "skid-steer loader", "spading machine", "spike harrow", "sprayer", "stone picker", "swather", "tiller", "tractor"] 
                  })
    puzzles.push({ name: "Crops From Mexico",
                   category: category,
                   words: ["Agave americana", "Agave fourcroydes", "Amaranth grain", "Amaranthus cruentus", "Annona purpurea", "Avocado", "Bixa orellana", "Carica papaya", "Castilla elastica", "Chayote", "Chili pepper", "Cocoa bean", "Dahlia", "Diospyros digyna", "Gossypium hirsutum", "Hominy", "Hylocereus undatus", "Lippia graveolens", "Maize", "Manilkara chicle", "Manilkara zapota", "Pachyrhizus erosus", "Panicum virgatum", "Pecan", "Piper auritum"]
                  })
    puzzles.push({ name: "Horse Saddle",
                   category: category,
                   words: ["bit", "bosal", "breast collar", "bridle", "bronc rein", "bucking roll", "cantle", "chaps", "cinch", "concho", "dally", "fender", "hackamore", "halter", "headstall", "oxbow stirrups", "reins", "rosette", "skirts", "spur", "spur strap", "stirrup", "stirrup leathers", "tapadero", "tree"] 
                  })
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      new_puzzle.words = puzzle[:words]
      new_puzzle.save!
    end
  end

  def make_puzzles_for_american_history_category
    puzzles = []
    category = "American History"
    puzzles.push({ name: "American Presidents",
                   category: category,
                   words: ["Abraham Lincoln", "Andrew Jackson", "Andrew Johnson", "Benjamin Harrison", "Calvin Coolidge", "Chester Arthur", "Dwight Eisenhower", "Franklin Pierce", "George Bush", "George Washington", "Gerald Ford", "Grover Cleveland", "Harry Truman", "Herbert Hoover", "James Garfield", "James Buchanan", "James Carter", "James Polk", "James Madison", "James Monroe", "John Adams", "John Kennedy", "John Quincy Adams", "John Tyler", "Lyndon Johnson", "Martin Van Buren", "Millard Fillmore", "Richard Nixon", "Ronald Reagan", "Rutherford Hayes", "Theodore Roosevelt", "Thomas Jefferson", "Ulysses Grant", "Warren Harding", "William Howard Taft", "William Clinton", "William McKinley", "Woodrow Wilson", "Zachary Taylor", "Barack Obama"]
                  })
    puzzles.push({ name: "American Revolution",
                   category: category,
                   words: ["Benedict Arnold", "Benjamin Franklin", "Boston Tea Party", "Bunker Hill", "Charleston", "Colonies", "George Washington", "Independence", "Lexington", "Locke", "Lord Cornwallis", "Loyalist", "Montreal", "New York", "Patriot", "Paul Revere", "Philadelphia", "Representation", "Saratoga", "Savannah", "Stamp Act", "Taxation", "Thirteen", "Treaty of Paris", "Yorktown"]
                  })
    puzzles.push({ name: "The 1900s",
                   category: category,
                   words: ["Andrew Carnegie", "Galveston", "Hawaii", "Henry Ford", "Jim Crow laws", "Assasination", "Model T", "NAACP", "Nickelodeon", "Oklahoma", "Panama Canal", "Sears catalog", "Sweet Adeline", "Teddy bears", "Theodore Roosevelt", "William McKinley", "William Taft", "Wonderful World of Oz", "Wright brothers"] 
                  })
    puzzles.push({ name: "The 1910s",
                   category: category,
                   words: ["Archduke Ferdinand", "Arizona", "Armistice", "Boy Scouts", "Calvin Coolidge", "Girl Scouts", "Haiti invasion", "Hindenburg Line", "Lusitania", "National Guard", "Neutrality", "New Mexico", "Panama Canal", "Pancho Villa", "Puerto Rico", "Treaty of Versailles", "Virgin Islands", "West Indies", "Woodrow Wilson", "World War"]
                  })
    puzzles.push({ name: "The 1920s",
                   category: category,
                   words: ["Al Jolson", "Black Tuesday", "Calvin Coolidge", "Charles Lindbergh", "Clara Bow", "Clarence Darrow", "Eight hour day", "Eugene Debs", "Flapper", "Great Depression", "Harlem Renaissance", "Herbert Hoover", "Jazz", "Marines in Nicaragua", "Model A", "Oscars", "Prohibition", "Radio", "Roaring", "Sacco and Vanzetti", "Scopes trial", "Stock market", "Warren Harding"]
                  })
    puzzles.push({ name: "The 1930s",
                   category: category,
                   words: ["Amelia Earhart", "Baby Face Nelson", "Dick and Jane", "Duke Ellington", "Dust Bowl", "Franklin Roosevelt", "Germany", "Great Garbo", "Great depression", "Hindenburg", "Jesse Owens", "John Dillinger", "Lake Placid", "Lindbergh baby", "Marlene Dietrich", "New Deal", "Poland", "Social security", "Star Spangled Banner", "War of the Worlds", "Warsaw Pact", "Woody Guthrie", "World War II"] 
                  })
    puzzles.push({ name: "The 1940s",
                   category: category,
                   words: ["Allies", "Axis", "Battle of the Bulge", "Britain", "D-Day", "France", "Franklin Roosevelt", "Germany", "Guadalcanal", "Harry Truman", "Hiroshima", "Iron curtain", "Italy", "Japan", "Maginot line", "Manhattan Project", "NATO", "Nagasaki", "Normandy", "North Africa", "Nuremberg", "Pearl Harbor", "Soviet Union", "Surrender", "United Nations"]
                  })
    puzzles.push({ name: "The 1950s",
                   category: category,
                   words: ["Alaska", "American Bandstand", "Beatniks", "Blacklist", "Blue jeans", "Civil rights", "Cold War", "Dwight Eisenhower", "Ed Sullivan", "Elvis Presley", "Frank Sinatra", "Hawaii", "Hula hoop", "Hydrogen bomb", "I Love Lucy", "Interstates", "Jack Kerouac", "James Dean", "Joseph McCarthy", "Korean War", "Martin Luther King", "Rosa Parks", "Television"] 
                  })
    puzzles.push({ name: "The 1960s",
                   category: category,
                   words: ["Baby boom", "Barbie", "Bay of Pigs", "Book depository", "Charles Manson", "Demonstration", "Gloria Steinem", "Grassy knoll", "Haight-Ashbury", "Hippies", "Jack Ruby", "Joan Baez", "Lee Harvey Oswald", "Love", "Peace", "Richard Nixon", "Smothers Brothers", "Vietnam War", "Woodstock"]
                  })
    puzzles.push({ name: "The 1970s",
                   category: category,
                   words: ["Affirmative action", "Atari", "Bellbottoms", "Cambodia", "David Berkowitz", "Disco", "Gerald Ford", "Iran hostage crisis", "Jonestown", "Kent State", "Led Zeppelin", "Louise Brown", "Love Canal", "Microprocessor", "Mood ring", "Patty Hearst", "Peace treaty", "Pet rock", "Punk rock", "Smiley face", "Three Mile Island", "Watergate"]
                  })
    puzzles.push({ name: "The 1980s",
                   category: category,
                   words: ["AIDS", "Apple Computer", "Betamax", "Break dancing", "Challenger", "Danielle Steele", "Exxon Valdez", "Generation X", "George Bush", "Grenada", "Iran Contra", "Jesse Jackson", "John Lennon", "Just Say No", "MTV", "Oliver North", "Ronald Reagan", "Stephen King", "Tom Clancy", "VHS"]  
                  })
    
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      new_puzzle.words = puzzle[:words]
      #puts new_puzzle.inspect #debugging
      new_puzzle.save!
    end
  end
end