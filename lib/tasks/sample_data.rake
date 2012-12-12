namespace :db do
  desc "Fill database with categorized puzzles"
  task populate: :environment do
    make_puzzles_for_holidays_category
    make_puzzles_for_agriculture_category
    make_puzzles_for_american_history_category
    make_puzzles_for_architecture
    make_puzzles_for_art
    make_puzzles_for_art_and_music
    make_puzzles_for_astronomy
    make_puzzles_for_basics
    make_puzzles_for_chemistry
    make_puzzles_for_cultures
    make_puzzles_for_economics
    make_puzzles_for_environmental
    make_puzzles_for_geology
    make_puzzles_for_government
    make_puzzles_for_health
    make_puzzles_for_tools
    make_puzzles_for_all_others
    sanitize_puzzles
  end

  def sanitize_puzzles
    WordSearchPuzzle.all.each do |p|
      p.name = p.name.category_to_link.link_to_category
      p.save!
    end
  end

  def commit_puzzles(puzzles)
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      puts puzzle[:words]
      new_puzzle.words = puzzle[:words]
      new_puzzle.save!
    end
  end

  def make_puzzles_for_holidays_category
    puzzles = []
    category = "Holiday"
    puzzles.push({ name: "Christmas",
                   category: category,
                   words: ["Boxing Day", "Chimney", "Cranberries", "Drummer boy", "Egg nog", "Fruitcake", "Gifts", "Holly", "Jesus", "Jingle bells", "Kris Kringle", "Manger", "Orange", "Ornament", "Red", "Santa Claus", "Shopping", "Silent night", "Stocking", "Tree", "Turkey", "White", "Wisemen", "Wreath", "Yuletide"]
                  })
    puzzles.push({ name: "Christmas",
                   category: category,
                   words: ["Blitzen", "Caroling", "Chestnuts", "Christmas Tree", "Comet", "Cupid", "Dancer", "Dasher", "Donner", "Elfs", "Frosty the Snowman", "Fruitcake", "Lumps of coal", "Mistletoe", "North Pole", "Poinsettias", "Prancer", "Presents", "Reindeer", "Rudolph", "Santa Claus", "Scrooge", "Sleigh", "Stockings", "Vixen"] 
                  })
    puzzles.push({ name: "Christmas",
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
    puzzles.push({ name: "Valentine's Day",
                   category: category,
                   words: ["Be Mine", "Cupid", "February", "arrows", "boyfriend", "cards", "chocolate", "date", "doily", "dove", "flowers", "forever", "frills", "girlfriend", "hearts", "hugs", "jewelry", "kisses", "lace", "love", "marry", "poems", "romance", "sweetheart"] 
                  })
    puzzles.push({ name: "4th of July",
                   category: category,
                   words: ["Adams", "Barbecue", "Baseball", "Blue", "Congress", "Constitution", "Declaration", "Fireworks", "Fourth", "Hancock", "Holiday", "Hot Dog", "Independence", "Jefferson", "July", "Parade", "Patriotism", "Philadelphia", "Picnic", "Red", "Stars", "Stripes", "White", "Yankee Doodle"]
                  })
    puzzles.push({ name: "Chinese New Year",
                   category: category,
                   words: ["China", "Dog", "Dragon", "Dumplings", "Family", "Fireworks", "Horse", "Lanterns", "Lion dance", "Lunar", "Mandarins", "Monkey", "Ox", "Packets", "Pig", "Plum tree", "Rabbit", "Rat", "Red", "Rooster", "Sheep", "Snake", "Spring", "Tiger", "Tikoy"] 
                  })
    puzzles.push({ name: "Cinco de Mayo",
                   category: category,
                   words: ["Battle of Puebla", "French", "Mexican", "Zaragoza", "chili", "conquest", "dances", "fiesta", "five", "flowers", "freedom", "green", "independence", "maracas", "mariachis", "music", "parades", "piatas", "red", "salsa", "sombrero", "tortilla", "triumph", "white", "may"] 
                  })
    puzzles.push({ name: "Earth Day",
                   category: category,
                   words: ["Earth", "San Francisco", "Vernal Equinox", "air pollution", "conserve", "ecology", "endangered species", "energy", "environment", "forest", "global warming", "oceans", "ozone layer", "planet", "protect", "recycle", "reduce", "reuse", "smog", "soil pollution", "trees", "water pollution", "wildlife"] 
                  })
    puzzles.push({ name: "Easter",
                   category: category,
                   words: ["Bunny", "Chocolate", "Christian", "Church", "Crucifixion", "Disciples", "Egg hunt", "Eggs", "Ham", "Holiday", "Hot cross buns", "Jesus", "Judas", "Last supper", "Lily", "Marshmallow", "Mass", "Monday", "Painting", "Pascha", "Purple", "Resurrection", "Sunday", "Vigil", "Yellow"] 
                  })
    puzzles.push({ name: "Father's Day",
                   category: category,
                   words: ["Appreciation", "Card", "Celebration", "Coffee mug", "Dad", "Daughter", "Family", "Father", "Gift", "Mow the lawn", "Old man", "Padre", "Papa", "Parent", "Party", "Pere", "Poem", "Pops", "Socks", "Son", "Sonora Dodd", "Sunday", "Tie", "Vatertag"] 
                  })
    puzzles.push({ name: "Groundhog Day",
                   category: category,
                   words: ["Canada", "Candlemas Day", "February", "Phil", "Punxsutawney", "United States", "burrow", "cloudy", "early", "forecast", "ground squirrel", "hibernate", "hide", "hole", "marmot", "peeks", "predict", "shadow", "six", "spring", "sunshine", "weather", "weeks", "winter", "woodchuck"] 
                  })
    puzzles.push({ name: "Halloween",
                   category: category,
                   words: ["bat", "black cat", "bones", "candy", "cauldron", "cobwebs", "costumes", "full moon", "ghost", "ghoul", "goblin", "graveyard", "haunted house", "jack-o-lantern", "masks", "monster", "mummy", "pumpkin patch", "skeleton", "spiders", "vampire", "werewolf", "witch", "zombie"] 
                  })
    puzzles.push({ name: "Halloween Costumes",
                   category: category,
                   words: ["angel", "astronaut", "ballerina", "bunny", "cat", "clown", "cowboy", "dragon", "fairy", "firefighter", "ghost", "hippie", "hula dancer", "knight", "ninja", "nurse", "pirate", "policeman", "princess", "pumpkin", "robot", "skeleton", "vampire", "witch", "zombie"]
                  })
    puzzles.push({ name: "Labor Day",
                   category: category,
                   words: ["Back to School", "End of Summer", "Canada", "Central Labor Union", "Colorado", "Knights of Labor", "Massachusetts", "Matthew Maguire", "Monday", "New Jersey", "New York", "Oregon", "Peter McGuire", "September", "Union Square", "United States", "parade", "unions", "working class"] 
                  })
    puzzles.push({ name: "Mother's Day",
                   category: category,
                   words: ["Ann Jarvis", "Anna Jarvis", "Appreciation", "Breakfast", "Card", "Chocolate", "Daughter", "Family", "Flowers", "Gift", "Hug", "Julia Ward Howe", "Kiss", "Love", "Madre", "Mama", "Maman", "Mamma Mia", "Mom", "Mother", "Parent", "Restaurant", "Son", "Spa", "Sunday"] 
                  })
    puzzles.push({ name: "St. Patrick's Day",
                   category: category,
                   words: ["Christian", "Clover", "Dublin", "Emerald", "Expatriate", "Feast", "Gold", "Green", "Guinness", "Holiday", "Holy trinity", "Ireland", "Irish", "Leprechaun", "Limerick", "Luck", "Mass", "Paddy", "Parade", "Patron saint", "Rainbow", "Roman Catholic", "Shamrock"] 
                  })
    puzzles.push({ name: "Thanksgiving",
                   category: category,
                   words: ["Carve", "Celebration", "Cranberry Sauce", "Fall", "Gratitude", "Gravy", "Horn of Plenty", "Indian Corn", "Maize", "Mashed Potatoes", "Mayflower", "Native Americans", "November", "Pilgrims", "Plymouth", "Pumpkin Pie", "Squanto", "Stuffing", "Sweet Potatoes", "Thursday", "Turkey", "Yams", "cornucopia", "harvest"] 
                  })
    puzzles.push({ name: "Valentine's Hearts",
                   category: category,
                   words: ["All Mine", "All Star", "Angel", "Awesome", "Be Good", "Be Mine", "Be True", "Cool", "For You", "How Nice", "I Hope", "Kiss Me", "Lets Kiss", "Love", "Love Her", "Love Life", "Love Me", "Love You", "My Baby", "My Way", "Sweet Talk", "True Love"] 
                  })
    puzzles.push({ name: "Veterans Day",
                   category: category,
                   words: ["Air Force", "Army", "Marines", "Navy", "November", "artillery", "battle", "courage", "defend", "freedom", "guard", "heroes", "history", "honor", "infantry", "memorial", "military", "militia", "national", "peace", "protect", "soldier", "valor", "veterans", "war"] 
                  })
    commit_puzzles(puzzles)
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
    commit_puzzles(puzzles)
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
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_architecture
    puzzles = []
    category = "Architecture"
    puzzles.push({ name: "Bridges",
                   category: category,
                   words: ["angled flange", "continuous", "counter braces", "cross-braced", "curved flange", "deck", "drift", "haunches", "hinges", "inclined leg", "intersection", "iron", "masonry", "orthotropic beam", "parallel flanges", "pony", "simple", "span", "splice plates", "steel", "stone", "through", "v-leg", "wood"] 
                  })
    puzzles.push({ name: "Building Materials",
                   category: category,
                   words: ["asphalt", "brick", "carpet", "cement", "cinder block", "glass", "granite", "grout", "insulation", "linoleum", "lumber", "marble", "mortar", "paint", "plaster", "rebar", "siding", "slate", "spackle", "steel", "stone", "stucco", "tile", "veneer", "wallpaper"] 
                  })
    puzzles.push({ name: "Castles in England",
                   category: category,
                   words: ["Appleby ", "Aydon", "Bedford", "Belsay", "Camber", "Dalton ", "Deal", "Elsdon", "Etal", "Farnham", "Goodrich", "Hurst", "Kendal", "Leeds", "Lincoln", "Morpeth", "Newark", "Norwich", "Odell", "Pickering", "Rufus", "Sandal", "Tutbury", "Upnor", "Wark"] 
                  })
    puzzles.push({ name: "Castles in Scotland",
                   category: category,
                   words: ["Airth", "Balfour", "Balloch", "Blackness", "Cawdor", "Crathes", "Delgatie", "Doune", "Drum", "Dumbarton", "Edzell", "Eilean Donan", "Fraser", "Fyvie", "Glamis", "Hailes", "Hume", "Inverness", "Kellie", "Loch Leven", "Mains", "Mugdock", "Newark", "Stirling"] 
                  })
    puzzles.push({ name: "Famous Bridges",
                   category: category,
                   words: ["Akashi-Kaikyo", "Arthur Kill", "Astoria", "Brooklyn", "Cape Cod Canal", "Chesapeake Bay", "Clifton Suspension", "Commodore Barry", "Francis Scott Key", "Fremont", "Golden Gate", "Humber", "Ikuchi", "Le Pont De Normandie", "Mississippi River", "San Francisco", "San Mateo-Hayward", "Sando", "Storbaelt", "Sydney Harbor", "Sydney Harbour", "Thatcher", "Ting Kau", "Tsing Ma", "Yangpu"] 
                  })
    puzzles.push({ name: "Tallest Structures",
                   category: category,
                   words: ["Aon Center", "BREN Tower", "Bank of China Tower", "Burj Dubai", "CITIC Plaza", "CN Tower", "Central Plaza", "Chrysler Building", "Emirates Tower One", "Gerbrandy Tower", "Jin Mao Tower", "John Hancock Center", "Nurek Dam", "Petronas Towers", "Sears Tower", "Shun Hing Square", "Sky Tower", "Tokyo Tower"] 
                  })
    puzzles.push({ name: "Types Of Bridges",
                   category: category,
                   words: ["Howe Truss", "Lenticular Truss", "Wichert Truss", "arch", "beam", "cable stayed", "cantilever", "closed spandrel arch", "fixed arch", "girder", "king post", "one-hinged arch", "open spandrel arch", "queen post", "rigid frame", "soul ribbed arch", "spandrel braced arch", "suspension", "three-hinged arch", "truss", "trussed deck arch", "trussed through arch", "two-hinged arch"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_art
    puzzles = []
    category = "Art"
    puzzles.push({ name: "American Artists",
                   category: category,
                   words: ["Andy Warhol", "Ansel Adams", "Ashley Bowen", "Chester Harding", "Edward Hicks", "Jackson Pollock", "Jasper Johns", "John James Audubon", "John Trumbull", "Joshua Shaw", "Maria Dixon", "Mary Wicks", "Mather Brown", "Norman Rockwell", "Rembrandt Peale", "Robert Rauschenberg", "Robert Salmon", "Sally Miller", "Samuel King", "Susan Rothenberg", "Thomas Birch", "Thomas Smith", "Thomas Sully", "William Dunlap", "William Rush"] 
                  })
    puzzles.push({ name: "Art Forms And Mediums",
                   category: category,
                   words: ["acting", "architecture", "cartooning", "ceramics", "choreography", "cinema", "dance", "digital art", "drawing", "game design", "graphic design", "mixed media", "model making", "mosaic", "music", "origami", "painting", "performance art", "photography", "poetry", "printmaking", "sculpture", "tattoo", "theatre", "wood carving"] 
                  })
    puzzles.push({ name: "Abstract Art Artists",
                   category: category,
                   words: ["Anish Kapoor", "Arthur Dove", "Ben Nicholson", "Burgoyne Diller", "Cy Twombly", "Elie Nadelman", "Henry Moore", "John Hewitt", "Julio Gonzalez", "Lucio Fontana", "Mike Wong Joon Fong", "Norma Nava", "Otto Freundich", "Pam Sanders", "Patrick Heron", "Paula Rego", "Robin Sperling", "Roger Hilton", "Rumyana Koleva", "Sir Anthony Caro", "Stuart Davis", "Wassily Kandinsky", "Willi Baumeister", "William Tucker"] 
                  })
    puzzles.push({ name: "Baroque Artists",
                   category: category,
                   words: ["Alessandro Algardi", "Alonso Cano", "Andrea Sacci", "Carlo Dolci", "Caspar Gras", "Charles Le Brun", "Daniele Crespi", "Domenico Feti", "Francis Bird", "Giovanni Baglione", "Gregorio Fernandez", "Jacob Duck", "Jan Both", "Jan Mytens", "Jan Steen", "Jan Victors", "John Bushnell", "Lambert Doomer", "Luca Giordana", "Philips Koninck", "Pierre Patel", "Pieter Lastman", "Salvator Rosa", "Stefano Maderno", "Vicente Carducho"] 
                  })
    puzzles.push({ name: "Expressionism Artists",
                   category: category,
                   words: ["Albert Pinkham Ryder", "Alfred Kubin", "August Macke", "Christian Rohlfs", "Constant Permeke", "Egon Schiele", "Emil Nolde", "Erich Heckel", "Ernst Barlach", "Franz Marc", "George Grosz", "Georges Rouault", "Ivan Mestrovic", "Jack Butler Yeats", "Jules Pascin", "Karel Appel", "Marguerite Zorach", "Marsden Hartley", "Max Beckmann", "Oskar Kokoschka", "Otto Dix", "Paul Klee", "Renato Guttuso", "Sir Jacob Epstein", "William Dobell"] 
                  })
    puzzles.push({ name: "Impressionism Artists",
                   category: category,
                   words: ["Alfred Sisley", "Armand Guillaumin", "Berthe Morisot", "Camille Pissarro", "Childe Hassam", "Claude Monet", "Dame Ethel Walker", "Edgar Degas", "Edouard Manet", "Ernest Lawson", "Eugene Boudin", "Frederic Bazille", "Giacomo Manzu", "Gustave Caillebotte", "John Ottis Adams", "Mary Cassatt", "Maurice Utrillo", "Max Liebermann", "Max Slevogt", "Medardo Rosso", "Rowena Meeks Abdy", "Tom Roberts"] 
                  })
    puzzles.push({ name: "Renaissance Artists",
                   category: category,
                   words: ["Adam Kraft", "Bellini", "Carlo Crivelli", "Cosimo Tura", "Donatello", "Dosso Dossi", "El Greco", "Filarete", "Fra Angelico", "Gerard David", "Hans Eworth", "Jean Duvet", "Konrad Witz", "Leonardo da Vinci", "Mabuse", "Michelangelo", "Neroccio", "Pedro Machuca", "Raphael", "Sassetta", "Sodoma", "Titian", "Tommaso Masaccio", "Vecchietta", "Veit Stoss"] 
                  })
    puzzles.push({ name: "Romanticism Artists",
                   category: category,
                   words: ["Alexander Runciman", "Eugene Delacroix", "Eugene Fromentin", "Frances Hodgkins", "Francesco Hayez", "Francois Rude", "Franz Pforr", "Gustave Dore", "Henry Fuseli", "Johan Christian Dahl", "John Constable", "John Crome", "John Linnell", "John Martin", "Orest Kiprensky", "Paul Delaroche", "Philipp Otto Runge", "Richard Bonington", "Samuel Palmer", "Theodore Gericault", "Washington Allston", "William Blake", "William Mulready", "William Ward"] 
                  })
    puzzles.push({ name: "Surrealism Artists",
                   category: category,
                   words: ["Alberto Giacometti", "Andre Breton", "Antonio Saura", "Ceri Richards", "Dorothea Tanning", "Edward Burra", "Eileen Agar", "Frida Kahlo", "Hans Arp", "Hans Bellmer", "Jean Lurcat", "Joan Miro", "Jock Macdonald", "Kay Sage", "Kurt Seligmann", "Leonora Carrington", "Marc Chagall", "Meret Oppenheim", "Paul Delvaux", "Paul Nash", "Rene Magritte", "Salvador Dali", "Wifredo Lam", "William Turnbull", "Yves Tanguy"] 
                  })
    puzzles.push({ name: "Crayola Crayon Colors",
                   category: category,
                   words: ["apricot", "brick red", "burnt sienna", "carnation pink", "copper", "cornflower", "gold", "goldenrod", "lemon yellow", "magenta", "maize", "maroon", "melon", "olive green", "orange red", "orange yellow", "orchid", "periwinkle", "plum", "red violet", "salmon", "sea green", "sky blue", "thistle", "yellow green"] 
                  })
    puzzles.push({ name: "Embroidery Stitches",
                   category: category,
                   words: ["basic cross", "bullion", "buttonhole", "cable", "chain", "cobbler", "diagonal raised band", "double running", "four sided", "fractional cross ", "french knots", "hemstitch", "honeycomb", "lazy daisy", "long armed cross", "pattern darning", "pulled double back", "pulled satin", "ringed back", "square filet", "stem", "tent", "three sided", "whipped chain"] 
                  })
    puzzles.push({ name: "Embroidery Terms",
                   category: category,
                   words: ["SPM", "applique", "backing", "birdnesting", "bobbin", "buckram", "column", "complex fill", "emblem", "fill", "finishing", "hook", "monogram", "needle", "pencil transfer", "puckering", "registration", "scaling", "stock design", "tackle twill", "tape", "thread", "topping", "underlay", "zigzag"]
                  })
    puzzles.push({ name: "Fashion Designers",
                   category: category,
                   words: ["Alexander McQueen", "Anna Sui", "Badgley Mischka", "Balenciaga", "Calvin Klein", "Carolina Herrera", "Chanel", "Christian Dior", "Donatella Versace", "Donna Karan", "Gucci", "Hermes", "Jean Paul Gaultier", "Kate Spade", "Louis Vuitton", "Marc Jacobs", "Marni", "Michael Kors", "Moschino", "Nanette Lepore", "Norma Kamali", "Prada", "Ralph Lauren", "Vera Wang"] 
                  })
    puzzles.push({ name: "Knitting Terms",
                   category: category,
                   words: ["A row counter", "Basket Weave Stitch", "Bind Off", "Cable Knitting", "Cast On", "Darning needle", "Decrease", "Dye Lot", "English Knitting", "Entrelac", "Fair Isle Knitting", "Garter Stitch", "Increase", "Intarsia", "Knitting needles", "Pattern", "Ribbing", "Scissors", "Skein", "Slip-Stitch", "Steek", "Stockinette Stitch", "Tension Gauge", "Yarn"] 
                  })
    puzzles.push({ name: "Painting Idioms",
                   category: category,
                   words: ["allegory", "body painting", "botanical", "broken color", "composition", "drybrush", "easel picture", "figure painting", "genre", "halo", "highlights", "illustration", "industrial", "landscape", "mural painting", "palette", "perspective", "portrait", "still life", "stippling", "technique", "underpainting", "varnish", "veduta"] 
                  })
    puzzles.push({ name: "Painting Styles",
                   category: category,
                   words: ["Baroque", "Color Field", "Neo-classicism", "abstract", "art deco", "contemporary", "cubism", "expressionism", "finger paint", "folk", "impressionism", "lyrical abstraction", "minimalism", "modernism", "op art", "orientalism", "photorealism", "pop art", "post modernism", "primitive", "romanticism", "socialist realism", "surrealism", "tachism"] 
                  })
    puzzles.push({ name: "Types Of Dances",
                   category: category,
                   words: ["ballet", "belly", "breakdance", "cancan", "cha-cha", "charleston", "conga", "fandango", "flamenco", "hula", "jitterbug", "limbo", "line", "mambo", "merengue", "polka", "rumba", "salsa", "samba", "square", "step", "swing", "tango", "tap", "waltz"] 
                  })
    puzzles.push({ name: "World Famous Paintings",
                   category: category,
                   words: ["American Gothic", "Clothed Maja", "False Start", "Impression Sunrise", "Las Meninas", "Madame Recamier", "Nightwatch", "Portrait of Louis XIV", "The Birth of Venus", "The Hay Wain", "The Kiss", "The Last Judgement", "The Last Supper", "The Scream", "The Sistine Madonna", "The Starry Night", "The Wandering Jew", "Woman III"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_art_and_music
    puzzles = []
    category = "Art & Music"
    puzzles.push({ name: "Annie Characters",
                   category: category,
                   words: ["Annette", "Annie", "Bert Healy", "Bundles McCloskey", "Cecille", "Drake", "Duffy", "Fred McCracken", "Grace Ferrell", "Ickes", "Jimmy Johnson", "July", "Kate", "Lily", "Miss Hannigan", "Molly", "Oliver Warbucks", "Pepper", "Roosevelt", "Rooster", "Sandy", "Sophie", "Tessie", "Ward"] 
                  })
    puzzles.push({ name: "Bye Bye Birdie",
                   category: category,
                   words: ["Alberto Peterson", "An English Teacher", "Baby Talk to Me", "Conrad Birdie", "Honestly Sincere", "Hugo Peabody", "Kids", "Kim MacAfee", "Lot of Livin To Do", "Mae Peterson", "Normal American Boy", "One Boy", "One Last Kiss", "Penelope Ann", "Put On A Happy Face", "Randolph MacAfee", "Rosie", "Rosie Alvarez", "Spanish Rose", "The Telephone Hour", "Ursula Merkle"] 
                  })
    puzzles.push({ name: "Camelot",
                   category: category,
                   words: ["Before I Gaze At You", "Camelot", "Fie On Goodness", "Follow Me", "Guenevere", "Guenevere", "How To Handle A Woman", "King Arthur", "Lady Catherine", "Merlyn", "Mordred", "Morgan Le Fey", "Nimue", "Parade", "Pellinore", "Sir Lancelot", "The Lusty Month of May"] 
                  })
    puzzles.push({ name: "Chicago",
                   category: category,
                   words: ["All I Care About", "All That Jazz", "Amos Hart", "Bandleader", "Billy Flynn", "Cell Block Tango", "Class", "Fred Casely", "Funny Honey", "I Know A Girl", "Little Bit of Good", "Mary Sunshine", "Matron Mama Morton", "Me and My Baby", "My Own Best Friend", "Nowadays", "Razzle Dazzle", "Roxie", "Roxie Hart", "Sergeant Fogarty", "Velma Kelly"] 
                  })
    puzzles.push({ name: "Evita Songs",
                   category: category,
                   words: ["Buenos Aires", "Hello and Goodbye", "Lament", "Latin Chant", "Oh What A Circus", "Partido Feminista", "Rainbow High", "Rainbow Tour", "Requiem for Evita", "Santa Evita", "She Is A Diamond", "Waltz for Eva and Che", "You Must Love Me"]
                  })
    puzzles.push({ name: "Grease Songs",
                   category: category,
                   words: ["Blue Moon", "Born To Hand Jive", "Grease", "Grease Megamix", "Greased Lightning", "Hound Dog", "Mooning", "Rydell Fight Song", "Sandy", "Summer Nights", "Tears on My Pillow", "Those Magic Changes", "We Go Together"]
                  })
    puzzles.push({ name: "Hairspray Characters",
                   category: category,
                   words: ["Amber Von Tussle", "Brad", "Brenda", "Corny Collins", "Doreen", "Edna Turnblad", "Fender", "IQ", "Link Larkin", "Little Inez", "Lou Ann", "Mikey", "Miss Wimsey", "Motormouth Maybelle", "Noreen", "Penny Pingleton", "Prudy Pingleton", "Seaweed", "Shelley", "Sketch", "Tracy Turnblad", "Velma Von Tussle", "Wilbur Turnblad"]
                  })
    puzzles.push({ name: "Hello, Dolly!",
                   category: category,
                   words: ["Ambrose Kemper", "Barnaby Tucker", "Call on Dolly", "Cornelius Hackl", "Dancing", "Dolly Levi", "Elegance", "Finale Ultimo", "Gussie Granger", "Horace Vandergelder", "I Put My Hand In", "Irene Molloy", "It Only Takes a Moment", "It Takes a Woman", "Minnie Fay", "Motherhood March", "Ribbons Down My Back", "Rudolph Reisenweber", "The Polka Contest", "The Waiters Gallop"] 
                  })
    puzzles.push({ name: "Les Miserables",
                   category: category,
                   words: ["Babet", "Bamatabois", "Bishop of Digne", "Brujon", "Claquesous", "Combeferre", "Cosette", "Courfeyrac", "Enjolras", "Eponine", "Fantine", "Fauchelevant", "Feuilly", "Foreman", "Gavroche", "Grantaire", "Javert", "Jean Valjean", "Joly", "Lesgles", "Madame Thenardier", "Marius", "Montparnasse", "Prouvaire", "Thenardier"] 
                  })
    puzzles.push({ name: "Les Miserables Songs",
                   category: category,
                   words: ["A Heart Full of Love", "A Little Fall of Rain", "At the End of the Day", "Beggars at the Feast", "Bring Him Home", "Castle on a Cloud", "Come to Me", "Dog Eats Dog", "I Dreamed a Dream", "In My Life", "Look Down", "Lovely Ladies", "Master of the House", "On My Own", "One Day More", "Red and Black", "Stars", "Thenardier Waltz", "Turning", "Wedding Chorale", "Who Am I"] 
                  })
    puzzles.push({ name: "Mamma Mia!",
                   category: category,
                   words: ["Bill Austin", "Chiquitita", "Dancing Queen", "Does Your Mother Know", "Donna Sheridan", "Gimme Gimme", "Harry Bright", "Lay All Your Love on Me", "Mamma Mia", "Our Last Summer", "Rosie", "Sam Carmichael", "Sophie Sheridan", "Super Trouper", "Take a Chance on Me", "Tanya", "The Name of the Game", "Under Attack", "Voulez-Vous"] 
                  })
    puzzles.push({ name: "Rent Songs",
                   category: category,
                   words: ["Another Day", "Christmas Bells", "Contact", "Goodbye Love", "I Should Tell You", "Life Support", "Light My Candle", "On the Street", "One Song Glory", "Out Tonight", "Over the Moon", "Rent", "Santa Fe", "Seasons of Love", "Take Me or Leave Me", "Tango Maureen", "What You Own", "Without You", "Your Eyes"] 
                  })
    puzzles.push({ name: "The Lion King",
                   category: category,
                   words: ["Be Prepared", "Chow Down", "Circle Of Life", "Endless Night", "Hakuna Matata", "He Lives in You", "King Of Pride Rock", "Mufasa", "Nala", "One By One", "Pumbaa", "Rafiki", "Sarabi", "Scar", "Shadowland", "Shenzi", "Simba", "The Morning Report", "They Live in You", "Timon", "Zazu"] 
                  })
    puzzles.push({ name: "Phantom of the Opera",
                   category: category,
                   words: ["All I Ask of You", "Angel Of Music", "Carlotta Giudicelli", "Christine Daae", "Firmin", "Joseph Buquet", "Madame Giry", "Magical Lasso", "Masquerade", "Meg Griy", "Prima Donna", "Raoul", "The Music of the Night", "The Point of No Return", "Think of Me", "Ubaldo Piangi"]
                  })
    puzzles.push({ name: "80s Hitmakers",
                   category: category,
                   words: ["Belinda Carlisle", "Billy Idol", "Bon Jovi", "Culture Club", "Cyndi Lauper", "Debbie Gibson", "Duran Duran", "Heart", "Journey", "Kiss", "Madonna", "Metallica", "Motley Crue", "Oingo Boingo", "Pat Benatar", "Pet Shop Boys", "Prince", "Sheena Easton", "Taylor Dayne", "The Bangles", "The Clash", "The Cult", "The Police", "Tiffany"] 
                  })
    puzzles.push({ name: "90s Hitmakers",
                   category: category,
                   words: ["Ace of Base", "Barenaked Ladies", "Boyz II Men", "Brandy", "Bryan Adams", "Celine Dion", "Color Me Badd", "EMF", "Hanson", "Janet Jackson", "Kris Kross", "Lauryn Hill", "Mariah Carey", "Michael Bolton", "Nelson", "New Kids on The Block", "PM Dawn", "Ricky Martin", "Roxette", "Seal", "Spice Girls"]
                  })
    puzzles.push({ name: "Ballet",
                   category: category,
                   words: ["adage", "arabesque", "ballerina", "ballon", "barre", "battement tendu", "cabriole", "cavalier", "cinq", "coda", "corps de ballet", "dessus", "devant", "en avant", "fish dive", "fondu", "grand", "grand battement", "mime", "pas", "pirouette", "plie", "pointe shoes", "rise", "tutu"] 
                  })
    puzzles.push({ name: "Big Band Leaders",
                   category: category,
                   words: ["Benny Carter", "Bill Elliott", "Billy May", "Cab Calloway", "Claude Bolling", "Dean Mora", "Duke Ellington", "Eddie Reed", "Eliot Lawrence", "Erskine Hawkins", "Fletcher Henderson", "George Gee", "Glenn Miller", "Henry Mancini", "Henry Red Allen", "Horace Henderson", "Jay McShann", "Les Brown", "Lionel Hampton", "Ray Anthony", "Ray McKinley", "Shorty Rogers", "Sy Oliver", "Terry Gibbs", "Tommy Dorsey"] 
                  })
    puzzles.push({ name: "Blues Musicians",
                   category: category,
                   words: ["Bessie Smith", "Billie Holiday", "Bo Diddley", "Dinah Washington", "Elmore James", "Etta James", "Fats Domino", "Freddie King", "Jimmy Reed", "Johnny Otis", "Koko Taylor", "Leroy Carr", "Little Walter", "Ma Rainey", "Magic Sam", "Memphis Minnie", "Memphis Slim", "Muddy Waters", "Ray Charles", "Rufus Thomas", "Sippie Wallace", "Slim Harpo", "Stevie Ray Vaughan", "Walter Davis"] 
                  })
    puzzles.push({ name: "Broadway Musicals",
                   category: category,
                   words: ["A Chorus Line", "Annie", "Annie Get Your Gun", "Bye Bye Birdie", "Camelot", "Cats", "Chicago", "Evita", "Fiddler on The Roof", "Funny Girl", "Grease", "Hairspray", "Les Miserables", "Lion King", "Miss Saigon", "Oklahoma", "Rent", "South Pacific", "The King and I"]
                  })
    puzzles.push({ name: "Wicked",
                   category: category,
                   words: ["Ama Clutch", "Boq", "Chistery", "Cowardly Lion", "Dorothy", "Elphaba", "Fiyero", "Frex", "Glinda", "Grommetik", "Irji", "Liir", "Madame Morrible", "Manek", "Melina", "Nessarose", "Nor", "Pfannee", "Professor Nikidik", "Sarima", "Shen Shen", "The Wizard of Oz", "Turtle Heart", "Yackle"]
                  })
    puzzles.push({ name: "Christian Hymns",
                   category: category,
                   words: ["Abide With Me", "Amazing Grace", "At the Cross", "Ave Maria", "Be Still My Soul", "Be Thou My Vision", "Blessed Assurance", "Fairest Lord Jesus", "God Of Our Fathers", "Holy Holy Holy", "How Great Thou Art", "In The Garden", "It is Well With My Soul", "Jesus Loves Me", "Jesus Paid It All", "Joyful Joyful", "Rock of Ages", "The Holy City", "The Old Rugged Cross", "To God Be the Glory"] 
                  })
    puzzles.push({ name: "Christian Songs",
                   category: category,
                   words: ["All About You", "All Around Me", "Arms of Jesus", "Back In His Arms", "Cry Out to Jesus", "East to West", "God of This City", "Grace Like Rain", "He", "I Will Rise", "In Me", "Jesus Messiah", "Justified", "Life", "Maker of the Stars", "Mountain of God", "My Deliverer", "Rise Up", "Run To You", "Saved", "Shifting Sand", "Show Me Your Glory", "This Man", "Undone", "Walk By Faith"] 
                  })
    puzzles.push({ name: "Classical Ballet",
                   category: category,
                   words: ["Ballet Gala", "Black Swan", "Blue Bird", "Cinderella", "Coppelia", "Don Quixote", "Fancy Free", "Firebird", "Giselle", "La Bayadere", "La Peri", "La Sylphide", "La Ventana", "Markitenka", "Napoli", "Peter Pan", "Romeo and Juliet", "Seven Beauties", "Sleeping Beauty", "Spectre de la Rose", "Swan Lake", "The Fairy Doll", "The Nutcracker", "Two By Drigo"] 
                  })
    puzzles.push({ name: "Classical Composers",
                   category: category,
                   words: ["Bach", "Beethoven", "Berlioz", "Brahms", "Chopin", "Elgar", "Faure", "Gershwin", "Handel", "Haydn", "Hoffman", "Holst", "Kuhlau", "Mahler", "Mendelssohn", "Mozart", "Pachelbel", "Scarlatti", "Schubert", "Schumann", "Shostakovich", "Sibelius", "Tchaikovsky", "Vivaldi", "von Weber"] 
                  })
    puzzles.push({ name: "Country Music Artists",
                   category: category,
                   words: ["Alabama", "Brooks And Dunn", "Clint Black", "Conway Twitty", "Crystal Gayle", "Dolly Parton", "Dwight Yoakam", "Garth Brooks", "Gene Autry", "George Strait", "Hank Williams", "John Denver", "Johnny Cash", "Kenny Rogers", "Loretta Lynn", "Patsy Cline", "Patty Loveless", "Randy Travis", "Reba McEntire", "Shania Twain", "The Judds", "Tim McGraw", "Toby Keith", "Waylon Jennings", "Willie Nelson"] 
                  })
    puzzles.push({ name: "Country Music Songs",
                   category: category,
                   words: ["A Boy Named Sue", "Always On My Mind", "Amazed", "Blue", "Crazy", "Delta Dawn", "Desperado", "El Paso", "Fancy", "Flowers On", "Folsom Prison Blues", "Friends In Low Places", "Galveston", "I Fall To Pieces", "I Will Always Love You", "Independence Day", "Lovesick Blues", "Ring of Fire", "Rose Garden", "Stand By Your Man", "The Gambler"] 
                  })
    puzzles.push({ name: "Elton John Songs",
                   category: category,
                   words: ["Believe", "Bennie and The Jets", "Blessed", "Blue Eyes", "Candle in The Wind", "Circle of Life", "Crocodile Rock", "Daniel", "Honky Cat", "Levon", "Madness", "Part-Time Love", "Rocket Man", "Sad Songs", "This Town", "Tiny Dancer", "Tonight", "True Love", "Your Song"]
                  })
    puzzles.push({ name: "Opera Composers",
                   category: category,
                   words: ["Amilcare Ponchielli", "Arrigo Boito", "Benjamin Britten", "Carlo Soliva", "Charles Gounod", "Francesco Cilea", "Fromental Halevy", "Gaetano Donizetti", "Georges Bizet", "Giacomo Puccini", "Gioachino Rossini", "Giussepe Verde", "Gustave Charpentier", "Heinrich Marschner", "Henry Purcell", "Jules Massenet", "Leos Janacek", "Luigi Mancinelli", "Pietro Mascagni", "Richard Strauss", "Ruggero Leoncavallo", "Saverio Mercadante", "Umberto Giordano", "Vincenzo Bellini"] 
                  })
    puzzles.push({ name: "Female Pop Artists",
                   category: category,
                   words: ["Amy Winehouse", "Bette Midler", "Beyonce Knowles", "Bjork", "Carly Simon", "Celine Dion", "Cher", "Christina Aguilera", "Cyndi Lauper", "Diana Ross", "Fergie", "Janet Jackson", "Jewel", "Katy Perry", "Kelly Clarkson", "Leona Lewis", "Madonna", "Mariah Carey", "Natalie Merchant", "Pink", "Sade", "Shakira", "Sheryl Crow", "Tori Amos", "Whitney Houston"]
                  })
    puzzles.push({ name: "Frank Sinatra",
                   category: category,
                   words: ["All the Way", "Anything Goes", "As Time Goes By", "Born Free", "Cheek to Cheek", "Come Fly With Me", "Dream", "Evergreen", "Faithful", "Get Happy", "High Hopes", "I See it Now", "It Had To Be You", "Jeepers Creepers", "Lady Day", "Mad About You", "My Girl", "Nancy", "Night and Day", "One Love", "Pass Me By", "The Good Life"] 
                  })
    puzzles.push({ name: "Jazz and Blues",
                   category: category,
                   words: ["Anna Jones", "Bessie Smith", "Billie Holiday", "Billy Massey", "Cab Calloway", "Clarence Williams", "Cleo Brown", "Dave Wilborn", "Don Redman", "Duke Ellington", "Ella Fitzgerald", "Ethel Waters", "Frankie Jaxon", "George Thomas", "Ivie Anderson", "Louis Armstrong", "Louis Jordan", "Noble Sissle", "Pha Terrell", "Thomas Waller", "Tom Stacks", "Victoria Spivey", "Viola McCoy", "Wesley Wilson"] 
                  })
    puzzles.push({ name: "Madonna Songs",
                   category: category,
                   words: ["Angel", "Borderline", "Celebration", "Cherish", "Crazy For You", "Dress You Up", "Express Yourself", "Holiday", "Into the Groove", "Justify My Love", "Like a Prayer", "Live to Tell", "Lucky Star", "Material Girl", "Open Your Heart", "Ray of Light", "Rescue Me", "Revolver", "Take a Bow", "Time Stood Still", "True Blue", "Vogue"] 
                  })
    puzzles.push({ name: "Male Pop Artists",
                   category: category,
                   words: ["Barry Manilow", "Ben Harper", "Billy Joel", "Bobby Brown", "Brian McKnight", "Bryan Adams", "Clay Aiken", "Don Henley", "George Michael", "Jack Johnson", "John Mayer", "Julio Iglesias", "Justin Timberlake", "Kenny Loggins", "Lionel Ritchie", "Lou Rawls", "Luther Vandross", "Michael Jackson", "Nick Carter", "Paul Simon", "Peter Cetera", "Rob Thomas", "Seal", "Sting", "Usher"] 
                  })
    puzzles.push({ name: "Michael Jackson",
                   category: category,
                   words: ["Another Part of Me", "Bad", "Beat It", "Ben", "Billie Jean", "Black or White", "Butterflies", "Dirty Diana", "Got to Be There", "Human Nature", "Man in The Mirror", "Remember the Time", "Rock With You", "Smooth Criminal", "The Girl Is Mine", "Thriller", "Who Is It", "You Are Not Alone", "You Rock My World"] 
                  })
    puzzles.push({ name: "Music Styles",
                   category: category,
                   words: ["Blues", "Broadway", "New Age", "aleatoric", "bluegrass", "classical", "country", "disco", "folk", "funk", "gospel", "heavy metal", "hip hop", "house", "jazz", "pop", "progressive rock", "punk rock", "reggae", "rhythm and blues", "rock and roll", "salsa", "soul", "techno"] 
                  })
    puzzles.push({ name: "Orchestral Instruments",
                   category: category,
                   words: ["English horn", "French horn", "bass clarinet", "bass drum", "bass trombone", "bassoon", "cello", "clarinet", "contrabassoon", "cymbals", "double bass", "flute", "harp", "marimba", "oboe", "piccolo", "snare drum", "timpani", "triangle", "trombone", "trumpet", "tuba", "viola", "violin", "xylophone"] 
                  })
    puzzles.push({ name: "Rock Musicians",
                   category: category,
                   words: ["Beatles", "Chuck Barry", "Creed", "David Bowie", "Deftones", "Elvis Presley", "Eric Clapton", "Etta James", "Fats Domino", "Grateful Dead", "Janis Joplin", "Jerry Lee Lewis", "Jimi Hendrix", "Led Zeppelin", "Little Richard", "Mick Jagger", "Pearl Jam", "Rush", "Soundgarden", "Talking Heads", "The Doors", "The Police", "Tool", "Van Halen"] 
                  })
    puzzles.push({ name: "Sammy Davis Jr.",
                   category: category,
                   words: ["Begin the Beguine", "Birth of the Blues", "Blame It On My Youth", "Bye Bye Blackbird", "For Once in My Life", "Guys and Dolls", "John Shaft", "Let There Be Love", "Life is A Woman", "My Romance", "Soon", "Talk to the Animals", "The Candy Man", "Thou Swell", "Time To Ride", "Too Close for Comfort"] 
                  })
    puzzles.push({ name: "Tap Dance",
                   category: category,
                   words: ["accent", "back flap", "ball change", "brush", "buffalo", "cake walk", "carryover", "click toes", "cluster", "dig", "double hop", "drag", "draw back", "esence", "flap", "glide", "grind", "heel change", "heel toe", "inside slide", "jingle", "patter", "riffle", "scoot", "slam"] 
                  })
    puzzles.push({ name: "Tap Dance 2",
                   category: category,
                   words: ["Back-Front", "Ball Beat", "Ball Tap", "Buck and Wing", "Catch Step", "Cincinnati", "Cork Screw", "Cross Bar", "Cross Leg Walk", "Cubanola", "Flea Hop", "Heel Twist", "ad lib", "ball beat", "bells", "bumps", "carryback", "catch", "chop", "chug", "click", "contrast", "counterpoint", "cramp", "cramproll"] 
                  })
    puzzles.push({ name: "Tap Dance 3",
                   category: category,
                   words: ["Bandy Twist", "Brush Flat", "Brush Step", "Double Irish", "Double Wings", "Falling Off the Log", "French Twist", "cut", "dig ball", "dig heel", "dig tap", "double hop", "double hop step", "draw", "draw back", "drum slap", "eccentric", "fall", "fan kick", "flip", "flop", "grab roll", "graboff", "hamp"] 
                  })
    puzzles.push({ name: "Tap Dance 4",
                   category: category,
                   words: ["Heel Brush Back", "Heel Close", "Heel Dig", "Heel Drop", "Heel Roll", "Heel Scuff", "Heel Stand", "Heel Thump", "Heel beat", "Jim Crow", "Military Dance", "Musical Comedy", "hamp", "hitch", "kick", "lamp", "leap", "lunge", "moderato", "nerve roll", "nerve tap", "off beat", "over the top", "paddle step", "parallel travel"]
                  })
    puzzles.push({ name: "Tap Dance 5",
                   category: category,
                   words: ["Rhythm Buck", "Russian Wings", "Shim Sham", "offbeat", "pickup", "pickup change", "pigeon toes", "pivot", "pull", "push beat", "railroad", "rattle", "riff", "riff walks", "roll", "rubber legs", "scuff", "scuffle", "seven", "shading", "skid", "slap", "slide", "slow drag", "snake hips"] 
                  })
    puzzles.push({ name: "Tap Dance 6",
                   category: category,
                   words: ["Spread Eagle", "soft shoe", "spot step", "spring", "stag leap", "stamp", "step", "step chug", "step pull", "stomp", "stomp roll", "strike", "strut", "stub", "stub toe walk", "swap wings", "swirl", "swivel", "tacet", "tanglefoot", "tap heel", "tap spring", "three", "tiller", "time step"] 
                  })
    puzzles.push({ name: "The Beatles",
                   category: category,
                   words: [ "John Lennon", "Ringo Star", "George Harrison", "Paul McCartney", "Across the Universe", "Act Naturally", "Dig a Pony", "Dizzy Miss Lizzy", "Eight Days a Week", "Fixing a Hole", "Helter Skelter", "We Can Work It Out"]
                  })
    puzzles.push({ name: "Percussion Instruments",
                   category: category,
                   words: ["Ashiko", "Bata drum", "Bendir", "Darbuka", "Deff drum", "Dhol drum", "Doumbek", "agogo", "bells", "bongos", "cajons", "castanets", "caxixi", "chimes", "conga drum", "cuica", "cymbals", "damroo", "egg shakers", "gong", "maracas", "rain stick", "shakere", "tambourine", "zills"] 
                  })
    puzzles.push({ name: "String Instruments",
                   category: category,
                   words: ["Balalaika", "Chickara", "Cumbus", "Ektara", "Erhu", "Esraj", "Gu Zheng", "Pipa", "Sarod", "Saz", "Sitar", "Tambura", "Veena", "banjo", "bass", "berimbau", "dulcimer", "guitar", "harp", "laouta", "lute", "rebab", "spike fiddle", "ukelele", "violin"] 
                  })
    puzzles.push({ name: "Wind Instruments",
                   category: category,
                   words: ["Bin", "French horn", "Ocarina", "Shvi", "accordion", "alphorn", "bagpipe", "bugle", "bulb horn", "clarinet", "cornet", "duduk", "fanfare trumpet", "fife", "flugelhorn", "flute", "harmonica", "harmonium", "mijwiz", "oboe", "piccolo", "shofar", "trombone", "trumpet", "whistle"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_astronomy
    puzzles = []
    category = "Astronomy"
    puzzles.push({ name: "Asteroids",
                   category: category,
                   words: ["Adeona", "Aurora", "Bertha", "Camilla", "Ceres", "Chicago", "Davida", "Dido", "Doris", "Elektra", "Elpis", "Hebe", "Herculina", "Hilda", "Ino", "Io", "Iris", "Juewa", "Julia", "Juno", "Nuwa", "Pales", "Palma", "Slyvia", "Vesta"] 
                  })
    puzzles.push({ name: "Astronomy",
                   category: category,
                   words: ["Earth", "Jupiter", "Mars", "Mercury", "Milky Way", "Neptune", "Pluto", "Saturn", "Sun", "Uranus", "Venus", "asteroid", "astronomy", "black hole", "comet", "constellation", "galaxy", "gravity", "light year", "meteor", "moon", "nebula", "satellite", "solar system", "universe"] 
                  })
    puzzles.push({ name: "Constellations",
                   category: category,
                   words: ["Andromeda", "Aquarius", "Cancer", "Capricornus", "Centaurus", "Chamaeleon", "Cygnus", "Dorado", "Draco", "Hercules", "Hydra", "Indus", "Leo", "Libra", "Lynx", "Mensa", "Orion", "Pegasus", "Phoenix", "Pisces", "Sagittarius", "Scorpius", "Taurus", "Ursa Major", "Virgo"] 
                  })
    puzzles.push({ name: "Galaxies",
                   category: category,
                   words: ["Andromeda I", "Andromeda II", "Canis Major Dwarf", "Carina Dwarf", "Cetus Dwarf", "Cigar", "Draco Dwarf", "Leo A", "Leo II Dwarf", "Milky Way", "Phoenix Drawf", "Pinwheel", "Sagittarius Dwarf ", "Sculptor Dwarf", "Sextans Dwarf", "Sombrero", "Sunflower", "Ursa Minor Dwarf", "Whirlpool"] 
                  })
    puzzles.push({ name: "Space Exploration",
                   category: category,
                   words: ["Alan Shepard", "Apollo", "Atlas", "Buzz Aldrin", "Columbia", "Gemini", "Hubble Telescope", "ISS", "John Glenn", "Lunar Rover", "Mars Pathfinder", "Mars Spirit Rover", "Mercury", "Mir", "Neil Armstrong", "Saturn V", "Skylab", "Soyuz", "Space Shuttle", "Space Walk", "Sputnik", "Viking", "Voyager", "Yuri Gagarin"] 
                  })
    puzzles.push({ name: "The Moon",
                   category: category,
                   words: ["Apollo", "Selenology", "apogee", "basin", "crater", "ejecta", "far side", "full moon", "gibbous moon", "highlands", "limb", "lunan", "lunar", "lunation", "new moon", "normal rilles", "patera", "perigee", "phase angle", "regolith", "sinuous rilles", "synodic month", "terra", "waning moon", "waxing moon"] 
                  })
    puzzles.push({ name: "The Sun",
                   category: category,
                   words: ["Helios", "Sol", "chromosphere", "convection zone", "corona", "energy", "faculae", "flares", "heliosphere", "helium", "magnetosphere", "photosphere", "plasma", "radiative zone", "rotation", "solar wind", "streamer", "sun loops", "sun spots", "ultraviolet", "yellow dwarf star"]
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_basics
    puzzles = []
    category = "Basics"
    puzzles.push({ name: "Colors",
                   category: category,
                   words: ["amber", "aquamarine", "beige", "black", "blue", "brown", "burgundy", "coral", "cyan", "gold", "gray", "green", "magenta", "maroon", "mauve", "navy", "orange", "periwinkle", "pink", "purple", "red", "silver", "teal", "white", "yellow"]
                  })
    puzzles.push({ name: "Shapes",
                   category: category,
                   words: ["arc", "circle", "cone", "crescent", "cube", "cylinder", "decagon", "dodecagon", "heptagon", "hexagon", "line", "line", "nonagon", "octagon", "oval", "pentagon", "poly", "polygon", "pyramid", "rectangle", "rhombus", "sector", "sphere", "square", "trapezoid", "triangle"]
                  })
    puzzles.push({ name: "Units of Measure",
                   category: category,
                   words: ["Celsius", "Fahrenheit", "centimeter", "dram", "fathom", "foot", "gallon", "gram", "inch", "kelvin", "kilogram", "kilometer", "meter", "microgram", "micrometer", "mile", "milligram", "millimeter", "nautical mile", "ounce", "pint", "pound", "quart", "ton", "yard"] 
                  })
    puzzles.push({ name: "Utensils",
                   category: category,
                   words: ["Baba mold", "Bain-marie", "Banneton", "Basting brush", "Basting syringe", "Bench scraper", "Blender", "Boil over preventer", "Bone scissors", "Bowl", "Bread knife", "Browning tray", "Butcher block", "Cake-server", "Can opener", "Candy thermometer", "Casserole", "Cauldron", "Cheese cloth", "Cheese grater", "Cheese slicer", "Chimta", "Chinoise", "Chop sticks", "Coconut grater", "Colander", "Cookie cutter", "Crab cracker", "Crab fork", "Crockery", "Cutting board", "Double boiler", "Dough blender", "Drum sieve", "Egg piercer", "Egg slicer", "Egg timer", "Faucet", "Fillet knife"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_chemistry
    puzzles = []
    category = "Chemistry"
    puzzles.push({ name: "Chemistry Basics",
                   category: category,
                   words: ["Alchemy", "Atom", "Biochemistry", "Bond", "Compound", "Crystal", "Element", "Endothermic", "Energy", "Exothermic", "Gas", "Inorganic", "Ion", "Isotope", "Liquid", "Matter", "Mole", "Molecule", "Organic", "Phase", "Reaction", "Salt", "Science", "Solid", "Substance"] 
                  })
    puzzles.push({ name: "Periodic Table",
                   category: category,
                   words: ["Actinium", "Aluminum", "Americium", "Antimony", "Argon", "Arsenic", "Astatine", "Barium", "Berkelium", "Beryllium", "Bismuth", "Bohrium", "Boron", "Bromine", "Cadmium", "Calcium", "Californium", "Carbon", "Cerium", "Cesium", "Chlorine", "Chromium", "Cobalt", "Copper", "Curium", "Darmstadtium", "Dubnium", "Dysprosium", "Einsteinium", "Erbium", "Europium", "Fermium", "Fluorine", "Francium", "Gadolinium", "Gallium", "Germanium", "Gold", "Hafnium", "Hassium", "Helium", "Holmium", "Hydrogen", "Indium", "Iodine", "Iridium", "Iron", "Krypton", "Lanthanum", "Lawrencium", "Lead", "Lithium", "Lutetium", "Magnesium", "Manganese", "Meitnerium", "Mendelevium", "Mercury", "Molybdenum", "Neodymium", "Neon", "Neptunium", "Nickel", "Niobium", "Nitrogen", "Nobelium", "Osmium", "Oxygen", "Palladium", "Phosphorus", "Platinum", "Plutonium", "Polonium", "Potassium", "Praseodymium", "Promethium", "Protactinium", "Radium", "Radon", "Rhenium", "Rhodium", "Rubidium", "Ruthenium", "Rutherfordium", "Samarium", "Scandium", "Seaborgium", "Selenium", "Silicon", "Silver", "Sodium", "Strontium", "Sulfur", "Tantalum", "Technetium", "Tellurium", "Terbium", "Thallium", "Thorium", "Thulium", "Tin", "Titanium", "Tungsten", "Ununbium", "Ununnilium", "Ununumium", "Uranium", "Vanadium", "Xenon", "Ytterbium", "Yttrium", "Zinc", "Zirconium"] 
                  })
    puzzles.push({ name: "Radioactive Substances",
                   category: category,
                   words: ["Actinium", "Americium", "Astatine", "Berkelium", "Californium", "Curium", "Einsteinium", "Fermium", "Francium", "Hahnium", "Lawrencium", "Mendelevium", "Neptunium", "Nobelium", "Plutonium", "Polonium", "Promethium", "Protactinium", "Radium", "Radon", "Rutherfordium", "Technetium", "Thorium", "Unnilhexium", "Uranium"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_cultures
    puzzles = []
    category = "Cultures"
    puzzles.push({ name: "Chinese Culture",
                   category: category,
                   words: ["Buddha", "Cantonese", "Chinese New Year", "Confucianism", "Lantern Festival", "Mandarin", "bamboo", "characters", "dim sum", "dog", "dragon", "duck", "fish", "fortune cookies", "jade", "luck", "moon", "red", "symbols", "talisman", "tiger", "wealth", "wok", "zodiac"] 
                  })
    puzzles.push({ name: "Japanese Culture",
                   category: category,
                   words: ["Bon-odori Festival", "Hanami", "Ikebana", "Irezumi", "bonsai trees", "cherry blossoms", "chopsticks", "fans", "geisha", "geta", "kimono", "koto", "obi", "ofuro", "paper lanterns", "parasols", "rice paper", "sake", "samurai", "silk", "sushi", "tatami", "tea", "wasabi", "zori"] 
                  })
    puzzles.push({ name: "Jewish Culture",
                   category: category,
                   words: ["Baklava", "Bar Mitzvah", "Bat Mitzvah", "Chanukah", "Hebrew", "Israel", "Judaism", "Kabbalah", "Kosher", "Ladino", "Passover", "Purim", "Rosh Hashanah", "Shabbat", "Shavuot", "Tanakh", "Torah", "Yiddish", "Yom Kippur", "cholent", "hamin", "kouclas", "kugel", "latkes", "synagogue"] 
                  })
    puzzles.push({ name: "Mexican Culture",
                   category: category,
                   words: ["Candlemas", "Cinco de Mayo", "Dia de los Muertos", "Las Posadas", "Mariachis", "Mexican Hat Dance", "Navidad", "Noche Buena", "Roman Catholicism", "Virgin Mary", "bullfighting", "chiles", "corn", "fiesta", "folk art", "green", "horchata", "marimba", "menudo", "red", "tacos", "tamales", "tortilla", "white"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_economics
    puzzles = []
    category = "Economics"
    puzzles.push({ name: "Accounting",
                   category: category,
                   words: ["accounts payable", "accounts receivable", "accrual accounting", "assets", "balance sheet", "bookkeeping", "cash", "chart of accounts", "cost accounting", "credits", "debits", "depreciation", "equity", "expenses", "financial statement", "general ledger", "interest", "journal", "liabilities", "loan", "note", "payroll", "profit", "revenue", "sales income"] 
                  })
    puzzles.push({ name: "American Corporations",
                   category: category,
                   words: ["American Express", "Bank of America", "Best Buy", "Chevron", "Coca-Cola", "Costco", "Deere", "Dell", "FedEx", "Ford", "General Motors", "Hewlett-Packard", "Intel", "Metlife", "Microsoft", "Motorola", "Prudential", "Safeway", "Sears", "State Farm", "Sysco", "Target", "Verizon", "Wal-Mart", "Walt Disney"] 
                  })
    puzzles.push({ name: "Foreign Cars",
                   category: category,
                   words: ["Acura", "Alfa Romeo", "Audi", "BMW", "Ferrari", "Honda", "Hyundai", "Lamborghini", "Lexus", "Maserati", "Mazda", "Mercedes Benz", "Mitsubishi", "Nissan", "Peugeot", "Porsche", "Renault", "Saab", "Subaru", "Suzuki", "Toyota", "Vauxhall", "Volkswagen", "Volvo", "Yugo"] 
                  })
    puzzles.push({ name: "World Currencies",
                   category: category,
                   words: ["birr", "cedi", "colon", "dirham", "dobra", "dollar", "dong", "dram", "euro", "franc", "kina", "kip", "lira", "mark", "peso", "pound", "quetzal", "rand", "ruble", "rupee", "shekel", "shilling", "sol", "won", "yen"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_environmental
    puzzles = []
    category = "Environmental"
    puzzles.push({ name: "Global Warming",
                   category: category,
                   words: ["Greenhouse Effect", "aerosols", "albedo", "atmosphere", "carbon dioxide", "carbon sinks", "deforestation", "emissions", "fossil fuels", "greenhouse gas", "methane", "nitrous oxide", "oceans", "ozone depletion", "ozone layer", "recycling", "renewable energy", "temperature", "temperature rise", "thermal expansion", "water vapor"]
                  })
    puzzles.push({ name: "Non Recyclables",
                   category: category,
                   words: ["Styrofoam", "candy wrappers", "carbon paper", "carpet", "cement", "cigarette butts", "dirt", "dishes", "flooring", "foil coated paper", "hangers", "laminated paper", "lead acid batteries", "mirrors", "paper clips", "photographs", "plastic coated paper", "plastic toys", "rock", "rubber bands", "sponges", "tissues", "toothpaste tubes", "waxed paper", "window glass"] 
                  })
    puzzles.push({ name: "Recyclables",
                   category: category,
                   words: ["aluminum", "aseptics", "books", "cardboard", "cell phones", "compact discs", "compost", "computer printers", "corks", "envelopes", "glass", "grocery bags", "magazines", "newspaper", "phone books", "posterboard", "produce bags", "steel", "sticky notes", "tin", "tires", "video tape", "wrapping paper"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_geology
    puzzles = []
    category = "Geology"
    puzzles.push({ name: "Earth",
                   category: category,
                   words: ["asthenosphere", "atmosphere", "continental crust", "convection current", "crust", "exosphere", "inner core", "ionosphere", "lithosphere", "lower mantle", "mesopause", "mesosphere", "nickel", "oceanic crust", "outer core", "ozone layer", "plate tectonics", "stratopause", "stratosphere", "thermosphere", "tropopause", "troposphere", "upper mantle", "uranium"]
                  })
    puzzles.push({ name: "Earthquakes",
                   category: category,
                   words: ["Rayleigh wave", "Richter scale", "S wave", "accelogram", "aftershocks", "asperity", "epicenter", "fault", "fault plane", "foreshocks", "harmonic tremor", "hypocenter", "isoseismal", "mainshock", "moment tensor", "paleoseismicity", "rupture front", "rupture velocity", "seismic waves", "seismic zone", "seismograph", "seismometer", "tensional stress", "wave front"] 
                  })
    puzzles.push({ name: "Famous Volcanoes",
                   category: category,
                   words: ["Acongua", "Cotopaxi", "El Chichon", "Kilauea", "Krakatau", "Lassen Peak", "Lassen Peak", "Llullaillaco", "Mauna Kea", "Mauna Loa", "Mount Etna", "Mount Fuji", "Mount Mazama", "Mount Pelee", "Mount Pinatubo", "Mount Rainer", "Mount Saint Helens", "Mount Shasta", "Mount Tambora", "Nevado de Ruiz", "Paricutin", "Stromboli", "Surtsey", "Vesuvius"] 
                  })
    puzzles.push({ name: "Gems",
                   category: category,
                   words: ["Agate", "Amber", "Amethyst", "Aquamarine", "Bloodstone", "Carnelian", "Citrine", "Coral", "Emerald", "Garnet", "Jasper", "Malachite", "Moissanite", "Obsidian", "Onyx", "Pearl", "Peridot", "Quartz", "Rose Quartz", "Sapphire", "Spinel", "Tiger Eye", "Topaz", "Turquoise", "Zircon"] 
                  })
    puzzles.push({ name: "Gems 2",
                   category: category,
                   words: ["Alexandrite", "Ammolite", "Aventurine", "Beryl", "Chrysoberyl", "Corundum", "Diamond", "Feldspar", "Ivory", "Jade", "Jadeite", "Jet", "Kunzite", "Lapis Lazuli", "Moonstone", "Mother Of Pearl", "Nephrite", "Opal ", "Quartz Rock Crystal", "Red Emerald", "Ruby", "Tanzanite", "Tourmaline", "Yellow Emerald"] 
                  })
    puzzles.push({ name: "Volcanoes",
                   category: category,
                   words: ["ash", "ash cloud", "base", "bedrock", "branch pipe", "caldera", "cinder cones", "conduit", "crater", "cyrovolcano", "felsic", "flank", "hot spots", "lahars", "lava", "lava domes", "magma chamber", "mantle plumes", "molten rock", "parasitic cone", "silica", "sill", "steam", "sulfur", "vent"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_government
    puzzles = []
    category = "Government"
    puzzles.push({ name: "Elected Officials",
                   category: category,
                   words: ["Assemblyman", "Assessor", "Attorney General", "Auditor", "Constable", "Coroner", "Councilman", "County Executive", "Delegate", "District Attorney", "Governor", "Judge", "Lieutenant", "Mayor", "President", "Prosecutor", "Recorder", "School Board Member", "Secretary of State", "Senator", "Sheriff", "Supervisor", "Surveyor", "Tax Collector", "Treasurer"] 
                  })
    puzzles.push({ name: "Government Terms",
                   category: category,
                   words: ["Bill of Rights", "Republic", "Senate", "Speaker of the House", "Supreme Court", "amendment", "appointed", "bill", "cabinet", "candidate", "checks and balances", "congress", "constitutional", "delegate", "democracy", "electoral college", "federal", "governor", "jury", "law", "majority", "minority", "veto"] 
                  })
    puzzles.push({ name: "New Deal",
                   category: category,
                   words: ["alphabet soup", "Glass-Steagall Act", "Social Security Act", "The Great Depression", "Wagner Act", "World War II", "economy", "employment", "recovery", "reform", "relief", "stock market crash"] 
                  })
    puzzles.push({ name: "Declaration of Independence",
                   category: category,
                   words: ["Abraham Clark", "Arthur Middleton", "Benjamin Franklin", "Benjamin Harrison", "Benjamin Rush", "Button Gwinnett", "Caesar Rodney", "Carter Braxton", "Charles Carroll", "Edward Rutledge", "Elbridge Gerry", "Francis Hopkinson", "Francis Lewis", "George Clymer", "George Read", "George Ross", "George Taylor", "George Walton", "George Wythe", "James Smith", "James Wilson", "John Adams", "John Hancock", "John Hart", "John Morton", "John Penn", "John Witherspoon", "Joseph Hewes", "Josiah Bartlett", "Lewis Morris", "Lyman Hall", "Matthew Thornton", "Oliver Wolcott", "Phillip Livingston", "Richard Henry Lee", "Richard Stockton", "Robert Morris", "Robert Treat Paine", "Roger Sherman", "Samuel Adams", "Samuel Chase", "Samuel Huntington", "Stephen Hopkins", "Thomas Jefferson", "Thomas McKean", "Thomas Stone", "William Ellery", "William Floyd", "William Hooper", "William Paca", "William Whipple", "William Williams"] 
                  })
    puzzles.push({ name: "US Constitution",
                   category: category,
                   words: ["Checks and Balances", "Congress", "Elections", "President", "Senate", "Supreme Court", "amendments", "due process of law", "executive power", "federal power", "freedom of assembly", "freedom of press", "freedom of religion", "freedom of speech", "freedom to petition", "judicial power", "legislative power", "right to bear arms", "search and seizure", "separation of powers", "speedy trial", "trial by jury"] 
                  })
    puzzles.push({ name: "US Governors",
                   category: category,
                   words: ["Bill Richardson", "Bill Ritter", "Bob Riley", "Bobby Jindal", "Charlie Crist", "Chet Culver", "Deval Patrick", "Eliot Spitzer", "Haley Barbour", "Jim Doyle", "Jim Gibbons", "John Baldacci", "John Lynch", "Jon Corzine", "Linda Lingle", "Matt Blunt", "Mike Beebe", "Mitch Daniels", "Patrick Quinn", "Rick Perry", "Ruth Ann Minner", "Sarah Palin", "Sonny Perdue", "Steve Beshear"] 
                  })
    puzzles.push({ name: "US Democrats",
                   category: category,
                   words: ["Al Franken", "Arlen Specter", "Barbara Boxer", "Bill Nelson", "Carl Levin", "Christopher Dodd", "Daniel Inouye", "Dianne Feinstein", "Harry Reid", "Herb Kohl", "Jack Reed", "Jim Webb", "Jon Tester", "Kent Conrad", "Maria Cantwell", "Mary Landrieu", "Max Baucus", "Patty Murray", "Robert Menendez", "Ron Wyden", "Sherrod Brown", "Thomas Carper", "Tim Johnson", "Tom Harkin", "Tom Udall"] 
                  })
    puzzles.push({ name: "US Republicans",
                   category: category,
                   words: ["Bill Frist", "Chuck Grassley", "Chuck Hagel", "Conrad Burns", "George Allen", "Gordon Smith", "Jeff Sessions", "Jim Bunning", "Jim Talent", "John Ensign", "John McCain", "John Warner", "Judd Gregg", "Larry Craig", "Lincoln Chafee", "Michael Crapo", "Olympia Snowe", "Orrin Hatch", "Pat Roberts", "Richard Lugar", "Richard Shelby", "Susan Collins", "Ted Stevens", "Trent Lott", "Wayne Allard"] 
                  })
    puzzles.push({ name: "Vice Presidents",
                   category: category,
                   words: ["Aaron Burr", "Andrew Johnson", "Calvin Coolidge", "Charles Curtis", "Elbridge Gerry", "George Clinton", "Hannibal Hamlin", "Henry Wilson", "John Adams", "John Nance Garner", "John Tyler", "Martin Van Buren", "Millard Fillmore", "Schuyler Colfax", "Theodore Roosevelt", "Thomas Jefferson", "William Rufus King"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_health
    puzzles = []
    category = "Health"
    puzzles.push({ name: "Childhood Illnesses",
                   category: category,
                   words: ["bladder infection", "chicken pox", "colic", "common cold", "croup", "diaper rash", "diarrhea", "ear infection", "excema", "febrile seizures", "fever", "fifth disease", "jaundice", "measles", "mumps", "nausea", "pink eye", "rash", "roseola", "rubella", "thrush", "tonsillitis", "vomiting", "whooping cough", "yeast infection"] 
                  })
    puzzles.push({ name: "Common Allergens",
                   category: category,
                   words: ["aspirin", "bee sting venom", "cashews", "cigarette smoke", "dairy", "detergents", "dust mites", "eggs", "fish", "grasses", "household cleaners", "peanuts", "peas", "penicillin", "pesticides", "pet dander", "poison ivy", "poison oak", "pollen", "shellfish", "soy", "sulfa", "walnuts", "weeds", "wheat"] 
                  })
    puzzles.push({ name: "Diabetes",
                   category: category,
                   words: ["acetone", "acidosis", "basal rate", "beta cell", "blood sugar", "brittle diabetes", "fructose", "glucagon", "glucose", "glucose monitoring", "hyperglycemia", "hypoglycemia", "insulin", "insulin dependent", "insulin pump", "insulin receptors", "insulin resistance", "juvenile diabetes", "ketones", "pancreas", "polydipsia", "polyphagia"] 
                  })
    puzzles.push({ name: "Eateries",
                   category: category,
                   words: ["bakery", "bistro", "cafe", "cafeteria", "cantina", "coffee shop", "deli", "diner", "donut shop", "food court", "hot dog stand", "ice cream parlor", "luncheonette", "mess hall", "patisserie", "pizzeria", "pub", "restaurant", "saloon", "snack bar", "sushi bar", "taco stand", "tapas bar", "tearoom", "trattoria"] 
                  })
    puzzles.push({ name: "Migraine Triggers",
                   category: category,
                   words: ["anxiety", "contraceptives", "dehydration", "diet", "fasting", "fluorescent light", "genetic factors", "heat", "high blood pressure", "hormone changes", "medication", "muscle tension", "nicotine", "physical exertion", "posture", "pregnancy", "sinus infections", "sleep apnea", "sleep changes", "stress", "strong scents", "sun", "weather changes"]
                  })
    puzzles.push({ name: "Natural Remedies",
                   category: category,
                   words: ["aloe", "bee pollen", "calcium", "cayenne", "chamomile", "chromium", "cinnamon", "copper", "cranberry", "dandelion", "elderberry", "feverfew", "fish oil", "flaxseed", "garlic", "ginger", "ginseng", "iron", "kelp", "lemon balm", "magnesium", "melatonin", "peppermint", "valerian"] 
                  })
    puzzles.push({ name: "Nutrition",
                   category: category,
                   words: ["beans", "breads", "calories", "carbohydrates", "cereals", "cheese", "dairy", "eggs", "fats", "fiber", "fish", "fruit", "grains", "meat", "milk", "monounsaturated fat", "nuts", "oils", "polyunsaturated fat", "poultry", "protein", "saturated fat", "sodium", "unsaturated fat", "vegetables"] 
                  })
    puzzles.push({ name: "Signs of Stress",
                   category: category,
                   words: ["anxiety", "constipation", "depression", "diarrhea", "fear", "frequent colds", "headache", "indecisiveness", "insomnia", "irritability", "isolating oneself", "loss of objectivity", "memory problems", "moodiness", "nausea", "negative thoughts", "over sleeping", "overeating", "poor judgment", "rapid heartbeat", "skin breakouts", "teeth grinding", "under eating", "weight gain", "weight loss"] 
                  })
    puzzles.push({ name: "Vice Presidents",
                   category: category,
                   words: ["Aaron Burr", "Andrew Johnson", "Calvin Coolidge", "Charles Curtis", "Elbridge Gerry", "George Clinton", "Hannibal Hamlin", "Henry Wilson", "John Adams", "John Nance Garner", "John Tyler", "Martin Van Buren", "Millard Fillmore", "Schuyler Colfax", "Theodore Roosevelt", "Thomas Jefferson", "William Rufus King"] 
                  })
    puzzles.push({ name: "Thyroid Terms",
                   category: category,
                   words: ["TSH", "adrenal", "endocrine", "energy ", "goiter", "growth", "hyperthyroid", "hypothyroid", "iodine", "metabolism", "myxedema", "overactive", "pituitary gland", "radioactive iodine", "thyroid cartilage", "thyroid gland", "thyroid hormone", "thyroid nodules", "thyroiditis", "thyroxine", "underactive"] 
                  })
    puzzles.push({ name: "Nutrients",
                   category: category,
                   words: ["vitamin ", "biotin", "calcium", "chromium", "copper", "folic acid", "iodine", "iron", "lutein", "lycopene", "magnesium", "manganese", "niacin", "phosphorus", "potassium", "riboflavin", "selenium", "thiamin", "zinc", "protein", "fat", "carbohydrate"]
                  })
    puzzles.push({ name: "Weight Training",
                   category: category,
                   words: ["back extension", "bench press", "bent over row", "biceps curl", "chest fly", "crunch", "dead press", "deadlift", "hip abductor", "hip adductor", "leg curl", "leg extension", "leg press", "leg raise", "lunge", "pull up", "pulldown", "pushdown", "seated calf raise", "shoulder fly", "shoulder press", "squat", "standing calf raise", "triceps extension", "upright row"] 
                  })
    puzzles.push({ name: "Yoga",
                   category: category,
                   words: ["bridge", "camel", "chair", "cobra", "crane", "crow", "downward-facing dog", "eagle", "fish", "full boat", "half moon", "hero", "lion", "locust", "lotus", "monkey", "mountain", "open angle", "peacock", "plank", "reclining", "side plank", "thunderbolt", "tortoise", "wheel"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_tools
    puzzles = []
    category = "Tools"
    puzzles.push({ name: "Linux",
                   category: category,
                   words: ["Arch", "ArtistX", "Astruix", "BackTrack", "Baltix", "BlankOn", "Buildix", "CentOS", "Easypeasy", "Eeebuntu", "ElementOS", "Fedora", "Fluxbuntu", "Gentoo", "GeoBox", "GnackTrack", "Goobuntu", "Guadalinex", "Hiweed", "Redhat Linux", "Slackware", "Spri", "Ubuntu", "eBow", "gNewSense", "gOS"] 
                  })
    puzzles.push({ name: "Types of Knots",
                   category: category,
                   words: ["Bachmann", "Bowline", "Bowline on a Bite", "Heden", "Klemheist", "Prusik", "clove hitch", "diamond knot", "double sheet bend", "figure eight", "flemish bend", "half hitch", "halyard knot", "overhand knot", "reef knot", "ring bend", "rolling hitch", "sheep shank", "sheet bend", "square knot", "studding sail", "timber hitch", "two half hitches"]
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_seasons
    puzzles = []
    category = "Seasons"
    puzzles.push({ name: "Autumn",
                   category: category,
                   words: ["Halloween", "Thanksgiving", "World Series", "acorns", "apples", "blustery", "brown", "cornstalks", "equinox", "fall", "gourds", "harvest moon", "leaves", "orange", "pumpkin patch", "pumpkin pie", "pumpkins", "raking", "red", "scarecrow", "school", "squash", "turkey", "wind", "yellow"] 
                  })
    puzzles.push({ name: "Spring",
                   category: category,
                   words: ["April showers", "Easter", "May flowers", "baskets", "blooms", "blossoms", "bonnet", "buds", "bunny", "cleaning", "daffodil", "eggs", "grass", "green", "kites", "lambs", "migration", "planting", "plowing", "raincoat", "robins", "seeds", "spring break", "tulip", "umbrella"] 
                  })
    puzzles.push({ name: "Summer",
                   category: category,
                   words: ["air conditioner", "barbeque", "bathing suit", "beach", "boardwalk", "boating", "camping", "fan", "fireflies", "fireworks", "hamburgers", "hot dogs", "ice cream", "lemonade", "mosquitoes", "ocean", "picnic", "pool", "sand", "sunglasses", "sunscreen", "sunshine", "tan", "vacation", "water ski"] 
                  })
    puzzles.push({ name: "Winter",
                   category: category,
                   words: ["blizzard", "boots", "cold", "dark", "earmuffs", "flurries", "frost", "frostbite", "gloves", "hats", "hibernation", "holidays", "icicles", "jacket", "mittens", "scarf", "shovel", "sled", "sleet", "sleigh", "snow", "snowflakes", "snowman", "snowsuit", "winter solstice"] 
                  })
    commit_puzzles(puzzles)
  end

  def make_puzzles_for_all_others
    puzzles = []
    puzzles.push({ name: "Animal Dwellings",
                     category: "Biology",
                     words: ["aviary", "barn", "birdhouse", "burrow", "cage", "cave", "coop", "den", "doghouse", "hill", "hive", "hole", "kennel", "lair", "mound", "nest", "pen", "perch", "pigpen", "roost", "stable", "stall", "tunnel", "web", "yard"]
                    })
    puzzles.push({ name: "Animal Groups",
                     category: "Biology",
                     words: ["army", "band", "brood", "bushel", "caravan", "cete", "cloud", "cluster", "colony", "drift", "drove", "flock", "gaggle", "herd", "horde", "kennel", "litter", "murder", "pack", "pod", "rookery", "school", "swarm", "tribe", "troop"]
                    })
    puzzles.push({ name: "Animal Phyla",
                     category: "Biology",
                     words: ["Annelida", "Arthropoda", "Brachiopoda", "Chaetognatha", "Chordata", "Cnidaria", "Ctenophora", "Echinodermata", "Entoprocta", "Gastrotricha", "Hemichordata", "Kinorhyncha", "Loricifera", "Mollusca", "Nematoda", "Nemertea", "Onychophora", "Phoronida", "Placozoa", "Platyhelminthes", "Porifera", "Priapulida", "Rotifera", "Sipuncula", "Tardigrada"]
                    })
    puzzles.push({ name: "Ants",
                     category: "Biology",
                     words: ["Argentine", "Big Head", "Bulldog", "Bullet", "Carpenter", "Crazy", "Farmer", "Fire", "Flying", "Gliding", "Honey Pot", "Jack Jumper", "Leaf Cutter", "Lemon", "Little Black", "New World Army", "Old World Army", "Pharaoh", "Slave Maker", "Soldier", "Thief", "Wasp", "Weaver", "Winged", "Yellow Citronella"]
                    })
    puzzles.push({ name: "Aquatic Birds",
                     category: "Biology",
                     words: ["auk", "booby", "coot", "crane", "dipper", "duck", "egret", "flamingo", "goose", "heron", "ibis", "kingfisher", "loon", "moorhen", "osprey", "pelican", "penguin", "puffin", "sandpiper", "sea gull", "skimmer", "stilt", "stork", "swan", "tern"]
                    })
    puzzles.push({ name: "Arctic Plants And Animals",
                     category: "Biology",
                     words: ["arctic azaleas", "arctic fox", "arctic hare", "arctic lupine", "arctic poppies", "arctic wolf", "beluga whale", "buttercups", "campanulas", "caribou", "cinquefoil", "lemming", "lichens", "musk oxen", "polar bear", "saxifrage", "seal", "snow goose", "snowy owl", "trout", "tundra", "tundra wolf", "walrus", "wild crocus", "wolverine"]
                    })
    puzzles.push({ name: "Biology Terms",
                     category: "Biology",
                     words: ["acid", "activation energy", "amino acid", "base", "carbohydrate", "chemical formula", "coenzyme", "compound", "covalent bond", "electron cloud", "element", "energy level", "enzyme", "ion", "ionic bond", "isomers", "kinetic energy", "lipid", "molecule", "nucleic acid", "polypeptide", "polysaccharide", "potential energy", "protein", "solution"]
                    })
    puzzles.push({ name: "Birds",
                     category: "Biology",
                     words: ["Blue Jay", "Cardinal", "Condor", "Coot", "Crane", "Crow", "Cuckoo", "Dipper", "Dove", "Duck", "Eagle", "Egret", "Falcon", "Finch", "Flamingo", "Hawk", "Lark", "Ostrich", "Owl", "Parrot", "Peacock", "Penguin", "Quail", "Raven", "Swan"]
                    })
    puzzles.push({ name: "Butterfly Life Cycle",
                     category: "Biology",
                     words: ["adult", "caterpillar", "chrysalis", "cocoon", "cremaster", "cuticle", "diapause", "ecdysis", "eclosion", "egg", "holometabolous", "imago", "instar", "larva", "larval period", "larval stage", "metamorphic stage", "metamorphosis", "molt", "pheromone", "pupa", "pupal period", "pupal stage", "silk", "stadium"]
                    })
    puzzles.push({ name: "Camouflaged Animals",
                     category: "Biology",
                     words: ["Bongo", "African Wild Cat", "African Wild Dog", "Antelope", "Arabian Camel", "Arctic Fern", "Arctic Fox", "Beluga Whale", "Blue-ringed Octopus", "Bull Shark", "Cape Buffalo", "Crab Spider", "Crocodile", "Flounder", "Frog", "King Snake", "Leaf-Mimic Katydid", "Leopard", "Longhorn Beetle", "Polar Bear", "Tiger", "Viceroy", "Walking Stick", "Zebra"]
                    })
    puzzles.push({ name: "Cat Breeds",
                     category: "Biology",
                     words: ["American Bobtail", "American Shorthair", "Balinese", "Bengal", "Birman", "Burmese", "Chartreux", "Cymric", "Devon Rex", "Havana Brown", "Himalayan", "Japanese Bobtail", "Korat", "Maine Coon", "Manx", "Munchkin", "Ocicat", "Oriental", "Persian", "Ragdoll", "Siamese", "Siberian", "Somali", "Sphynx", "York Chocolate"]
                    })
    puzzles.push({ name: "Cell Functions",
                     category: "Biology",
                     words: ["Krebs cycle", "active transport", "aerobic respiration", "anaphase", "cytokenesis", "diffusion", "division", "endocytosis", "fermentation", "glycosis", "inhibitors", "interphase", "meiosis", "metaphase", "mitosis", "osmosis", "passive transport", "phagocytosis", "photosynthesis", "pinocytosis", "prophase", "replication", "reproduction", "telophase"]
                    })
    puzzles.push({ name: "Crustaceans",
                     category: "Biology",
                     words: ["American Lobster", "American Spider Crab", "Barnacles", "Beach Slater", "Boxer Hermit Crab", "Common Hermit Crab", "Mantis Shrimp", "Marine Pill Bug", "Miner Hermit Crab", "Pebble Crab", "Red Rock Crab", "Sailor Shrimp", "Sand Crab", "Sand Ghost Shrimp", "Sand Skater", "Sea Centipede", "Sea Louse", "Seaweed Crab", "Skeleton Louse", "Sponge Crab", "Sponge Shrimp", "Striated Hermit Crab", "Weed Shrimp"]
                    })
    puzzles.push({ name: "Desert Plants",
                     category: "Biology",
                     words: ["Acacia", "Agave", "Aloe", "Bird of Paradise", "Bougainvillea", "Cactus", "Carob", "Crape Myrtle", "Desert Willow", "Indian Paintbrush", "Jacaranda", "Jasmine", "Joshua Tree", "Lantana", "Mesquite", "Mojave Aster", "Oleander", "Palm", "Poison Ivy", "Prickly Pear", "Rosemary", "Sage", "Stinging Nettles", "Verbena", "Yucca"]
                    })
    puzzles.push({ name: "Dog Breeds",
                     category: "Biology",
                     words: ["Akita", "Beagle", "Boxer", "Bulldog", "Bullmastiff", "Chihuahua", "Chow Chow", "Cockapoo", "Dachshund", "Dalmatian", "German Shepherd", "Golden Retriever", "Great Dane", "Greyhound", "Hound", "Lhasa Apso", "Maltese", "Poodle", "Pug", "Rottweiler", "Schnauzer", "Shih Tzu", "Siberian Husky", "Terrier"]
                    })
    puzzles.push({ name: "Endangered Species",
                     category: "Biology",
                     words: ["African Elephant", "Asian Elephant", "Asiatic Cheetah", "Bald Eagle", "Bison", "Blue Whale", "Boa Constrictor", "California Condor", "Desert Tortoise", "Fin Whale", "Giant Armadillo", "Giant Panda", "Gorilla", "Great Egret", "Grizzly Bear", "Harpy Eagle", "Hybrid Spider Monkey", "Iberian Lynx", "Marine Otter", "Red Wolf", "Snow Leopard", "Tiger", "White-winged Duck", "Whooping Crane"]
                    })
    puzzles.push({ name: "Extinct Animals",
                     category: "Biology",
                     words: ["American Mastodon", "Caspian Tiger", "Cave Bear", "Cave Lion", "Dinotherium", "Dodo", "English Wolf", "Giant Ground Sloth", "Glyptodon", "Great Auk", "Hairy Mammoth", "Irish Deer", "Long Jawed Mastodon", "Moeritherium", "Palaeomastodon", "Quagga", "Saber Tooth Tiger", "Southern Mammoth", "Tasmanian Wolf", "Tetrabelodon", "Trilophodon", "Tyrannosaurus Rex", "Wooly Rhinoceros"]
                    })
    puzzles.push({ name: "Food Chain",
                     category: "Biology",
                     words: ["animals", "autotrophs", "bacteria", "bioaccumulation", "carnivores", "consumers", "decomposers", "detritivores", "energy", "fungi", "herbivores", "heterotrophs", "omnivores", "plants", "predator", "prey", "primary consumers", "producers", "pyramid of energy", "scavengers", "secondary consumers", "sun", "tertiary consumers", "trophic levels", "trophic pyramids"]
                    })
    puzzles.push({ name: "Genetics",
                     category: "Biology",
                     words: ["DNA", "Gregor Mendel", "Punnett square", "alleles", "autozygosity", "codominance", "dihybrid cross", "dominant gene", "epistasis", "epistatic", "genotype", "hemizygous", "hereditary", "heterozygous", "homozygous", "hypostatic", "inherited", "modifier genes", "monohybrid cross", "phenotype", "recessive gene", "zygosity"]
                    })
    puzzles.push({ name: "Hibernating Animals",
                     category: "Biology",
                     words: ["Gila Monster", "Ground Squirrel", "Mud Turtle", "Prairie Dog", "badger", "bat", "bear", "bee", "butterfly", "chipmunk", "earthworm", "frog", "groundhog", "hamster", "hedgehog", "ladybug", "lizard", "marmot", "moth", "mouse", "raccoon", "skunk", "snail", "snake", "toad"]
                    })
    puzzles.push({ name: "Horse Breeds",
                     category: "Biology",
                     words: ["Andalusian", "Arabian", "Azteca", "Barb", "Belgian", "Canadian", "Caspian", "Clydesdale", "Dole Trotter", "Egyptian", "Falabella", "Finnish", "Gypsy Vanner", "Hackney", "Irish Draught", "Lusitano", "Mongolian", "Mustang", "Nez Perce", "Palomino", "Pinto", "Shire", "Thoroughbred", "Tinker", "Westphalian"]
                    })
    puzzles.push({ name: "Human And Animal Senses",
                     category: "Biology",
                     words: ["audition", "echolocation", "electroception", "epigastric sense", "equilibrioception", "esophageal", "excretory", "gustation", "hearing", "lateral line", "magnetoception", "mechanoreception", "nociception", "olfaction", "propioception", "sight", "smell", "tactition", "taste", "thermoception", "time sense", "touch", "vascular sense", "vision"]
                    })
    puzzles.push({ name: "Human Circulatory System",
                     category: "Biology",
                     words: ["Angina", "Aorta", "Arrest", "Artery", "Atrium", "Blood", "Capillary", "Carotid", "Diastole", "Heart", "Heart", "Jugular", "Oxygen", "Pacemaker", "Plasma", "Platelets", "Pressure", "Pulse", "Red cells", "Systole", "Tension", "Valve", "Vein", "Ventricle", "White cells"]
                    })
    puzzles.push({ name: "Human Digestive System",
                     category: "Biology",
                     words: ["Anus", "Appendix", "Bile", "Cecum", "Colon", "Digestion", "Duodenum", "Entrail", "Esophagus", "Food", "Gallbladder", "Gastrointestinal", "Ileum", "Intestine", "Liver", "Mouth", "Mucus", "Nutrients", "Pancreas", "Rectum", "Saliva", "Stomach", "Tongue", "Tract", "Vitamin"]
                    })
    puzzles.push({ name: "Human Immune System",
                     category: "Biology",
                     words: ["AIDS", "B cell", "T cell", "anaphylactic", "antibiotic", "antibody", "antigen", "coagulation", "complement", "disease", "disease", "fever", "hormone", "inflammation", "lymphocyte", "parasite", "pathogen", "phagocyte", "phlegm", "platelets", "sick", "vaccine", "vacteria", "virus", "white blood cells"]
                    })
    puzzles.push({ name: "Human Nervous System",
                     category: "Biology",
                     words: ["Axon", "Brain", "Broca", "Cell", "Cerebellum", "Cord", "Cortex", "Dendrite", "Electric", "Ganglia", "Glial cell", "Gray matter", "Homeostasis", "Impulse", "Lobe", "Myelin", "Nerve", "Neuron", "Occipital", "Parietal", "Pituitary", "Spine", "Temporal", "Transmitter", "White matter"]
                    })
    puzzles.push({ name: "Human Reproductive System",
                     category: "Biology",
                     words: ["Bladder", "Cervix", "Clitoris", "Egg", "Ejaculation", "Endometrium", "Epididymis", "Estrogen", "Fallopian", "Labia", "Menstruation", "Ovary", "Ovulation", "Penis", "Pituitary", "Progesterone", "Prostate", "Scrotum", "Seminal vesicle", "Sperm", "Testicle", "Testosterone", "Urethra", "Uterus", "Vagina", "Vas deferens"]
                    })
    puzzles.push({ name: "Insects",
                     category: "Biology",
                     words: ["ant", "aphid", "bee", "beetle", "butterfly", "centipede", "cicada", "cockroach", "cricket", "dragonfly", "fly", "grasshopper", "katydid", "lacewing", "mayfly", "millipede", "mosquito", "moth", "praying mantis", "spider", "stink bug", "tarantula", "walking stick", "wasp", "weevil"]
                    })
    puzzles.push({ name: "Mammals",
                     category: "Biology",
                     words: ["Beaver", "Bighorn Sheep", "Black Bear", "Bobcat", "Cheetah", "Cougar", "Coyote", "Duck-billed Platypus", "Elephant", "Gorilla", "Grizzly Bear", "Jaguar", "Kangaroo", "Koala", "Leopard", "Lion", "Mongoose", "Panda Bear", "Polar Bear", "Raccoon", "Sea Otter", "Tasmanian Devil", "Walrus", "Yak", "Zebra"]
                    })
    puzzles.push({ name: "Migrating Animals",
                     category: "Biology",
                     words: ["Humpback whale", "Monarch butterfly", "bird", "bison", "caribou", "duck", "earthworm", "eel", "elephant", "geese", "gnu", "hawk", "lemming", "locust", "moose", "owl", "salmon", "sea turtle", "seal", "tern", "toad", "trout", "whale", "wildebeest", "zebra"]
                    })
    puzzles.push({ name: "Parts Of A Cell",
                     category: "Biology",
                     words: ["cell membrane", "cell wall", "chlorophyll", "chloroplasts", "chromosomes", "chromotin", "cytoplasm", "flagellum", "golgi bodies", "granum", "lyosome", "microtubule", "mitochondria", "nuclear envelope", "nuclear membrane", "nuclear pore", "nucleolus", "nucleoplasm", "nucleus", "organelles", "plastid", "ribosomes", "stroma", "vacuole"]
                    })
    puzzles.push({ name: "Penguins",
                     category: "Biology",
                     words: ["Adelie", "African", "Chatham Islands", "Chinstrap", "Crested", "Emperor", "Erect-Crested", "Fairy", "Fiordland", "Galapagos", "Gentoo", "Humboldt", "Jackass", "King", "Little", "Little Blue", "Macaroni", "Magellanic", "Northern Little", "Patagonian", "Rockhopper", "Royal", "Snares", "White-Flippered", "Yellow-Eyed"]
                    })
    puzzles.push({ name: "Plant Biology",
                     category: "Biology",
                     words: ["angiosperm", "auxins", "cortex", "cotyledons", "cuticle", "dermal tissue", "epidermis", "gravitropism", "ground tissue", "gymnosperm", "lignin", "megaspore", "meristem", "microspore", "phloem", "photoperiodism", "phototopism", "procambium", "root system", "shoot system", "sieve tubes", "stomata", "tracheids", "vascular tissue", "xylem"]
                    })
    puzzles.push({ name: "Pollination",
                     category: "Biology",
                     words: ["Anemophily", "Entomophily", "Hydrophily", "Zoophily", "abiotic pollination", "angiosperms", "autogamy", "biotic pollination", "carpel", "cleistogamy", "cross-pollination", "fertilization", "gametes", "gymnosperms", "ovule", "pistil", "pollen", "pollenizers", "pollinator", "reproduction", "seeds", "self-pollination", "stamen", "stigma", "syngamy"]
                    })
    puzzles.push({ name: "Primates",
                     category: "Biology",
                     words: ["Brown Lemur", "Bushbaby", "Celebes Macaque", "Chacma Baboon", "Colobus Monkey", "Cotton-top Tamarin", "Douc Langur", "Hamadryas Baboon", "Hanuman Langur", "Mouse Lemur", "Owl Monkey", "Patas Monkey", "Potto", "Purple-faced Langur", "Pygmy Marmoset", "Re Uakari", "Rhesus Monkey", "Ring-Tailed Lemur", "Ruffed Lemur", "Spider Monkey", "Squirrel Monkey", "Vervet Monkey", "Weeping Capuchin", "Wooly Monkey", "Wooly Spider Monkey"]
                    })
    puzzles.push({ name: "Protozoa",
                     category: "Biology",
                     words: ["Globigerina", "Gymnodinium", "Protista", "actinopoda", "amoeba", "autotrophic", "cilia", "ciliates", "dinoflagellates", "euglena", "eukaryotes", "eukaryotic", "flagella", "flagellate", "foraminiferans", "heterotrophic", "kineties", "parasitic", "plasmodium", "prokaryotes", "pseudopods", "rhizopoda", "sporozoans", "symbiotic", "unicellular"]
                    })
    puzzles.push({ name: "Reflexes",
                     category: "Biology",
                     words: ["accomodation", "achilles", "biceps stretch", "blinking", "brachioradialis", "corneal", "crossed extensor", "escape", "gag", "grasp", "hand-to-mouth", "jaw jerk", "moro", "oculocardiac", "optokinetic", "patellar", "photic sneeze", "plantar", "pupillary", "scratch", "sucking", "triceps stretch", "withdrawal"]
                    })
    puzzles.push({ name: "Tropical Plants",
                     category: "Biology",
                     words: ["Acai", "Amor seco", "Artichoke", "Bitter Melon", "Brazil Nut", "Cacao", "Cashew", "Damiana", "Epazote", "Fedegoso", "Guaco", "Guava", "Hortela", "Iporuru", "Jatoba", "Maca", "Mango", "Mimosa", "Nettles", "Papaya", "Passionflower", "Quassia", "Rosewood", "Sarsaparilla", "Turmeric"]
                    })
    puzzles.push({ name: "Tropical Trees",
                     category: "Biology",
                     words: ["African Tulip", "Avocado", "Bamboo", "Banana", "Banyan", "Bottlebrush", "Breadfruit", "Calabash", "Candlenut", "Chinaberry", "Coconut Palm", "Coffee Tree", "Crape Myrtle", "Date Palm", "Dragon Tree", "Ebony", "Flame Tree", "Gold Tree", "Jacaranda", "Lipstick Tree", "Lychee", "Mahogany", "Royal Palm", "Sandalwood", "Teak"]
                    })
    puzzles.push({ name: "Types Of Sharks",
                     category: "Biology",
                     words: ["Angel", "Banjo", "Bignose", "Blue", "Borneo", "Broadfin", "Bull", "Copper", "Dusky", "Great White", "Hammerhead", "Hardnose", "Horned", "Kitefin", "Lantern", "Leopard", "Mako", "Milk", "Nurse", "Sandbar", "Spottail", "Thresher", "Tiger", "Whale", "Zebra"]
                    })
    puzzles.push({ name: "Types Of Whales",
                     category: "Biology",
                     words: ["Antarctic Minke", "Beluga", "Blue", "Bowhead", "Fin", "Gray", "Humpback", "Narwhal", "North Atlantic Right", "North Pacific Right", "Northern Bottlenose", "Pygmy Sperm", "Sei", "Southern Bottlenose", "Southern Right", "Spade-toothed", "Sperm", "Strap-toothed"]
                    })
    puzzles.push({ name: "Types of Dolphins",
                     category: "Biology",
                     words: ["Amazon River", "Arabian Common", "Atlantic Humpback", "Atlantic Spotted", "Australian Snubfin", "Bottlenose", "Chilean", "Chinese River", "Clymene", "Dusky", "Dusky", "Indian Humpback", "Irrawaddy", "Long-Beaked Common", "Pacific Humpback", "Pantropical Spotted", "Rough-Toothed", "Short-Beaked Common", "Spinner", "Striped", "White-Beaked"]
                    })
    puzzles.push({ name: "Types of Snakes",
                     category: "Biology",
                     words: ["Anaconda", "Asp", "Black Racer", "Boa Constrictor", "Bull Snake", "Common Keelback", "Copperhead", "Corn Snake", "Cottonmouth", "Diamondback", "Garter Snake", "Gopher Snake", "Green Mamba", "Green Snake", "Hognose Snake", "Indigo Snake", "King Cobra", "Milk Snake", "Python", "Queen Snake", "Rat Snake", "Rattlesnake", "Sea Snake", "Smooth Snake", "Tiger Snake"]
                    })
    puzzles.push({ name: "Wild Cats",
                     category: "Biology",
                     words: ["African Wildcat", "Andean Mountain", "Bay Cat", "Black-Foot", "Bobcat", "Caracal", "Cheetah", "Cougar", "Fishing Cat", "Jaguar", "Kodkod", "Leopard", "Lion", "Margay", "Northern Lynx", "Ocelot", "Oncilla", "Pampas Cat", "Rusty-Spotted", "Serval", "Snow Leopard", "Tiger", "African Golden"]
                    })
    puzzles.push({ name: "Acclaimed Plays",
                     category: "English",
                     words: ["A Man for All Seasons", "Amadeus", "Angels in America", "Cat on a Hot Tin Roof", "Copenhagen", "Death of a Salesman", "Equus", "Gelngarry Glen Ross", "Hurlyburly", "Shirley Valentine", "The Crucible", "The Elephant Man", "The Odd Couple", "The Seagull", "Three Sisters", "Waiting for Godot"]
                    })
    puzzles.push({ name: "Adverbs",
                     category: "English",
                     words: ["almost", "completely", "consequently", "faster", "finally", "furthermore", "however", "incidentally", "indeed", "instead", "lately", "likewise", "literally", "meanwhile", "nonetheless", "otherwise", "quickly", "really", "simply", "slowest", "slowly", "still", "then", "therefore", "usually"]
                    })
    puzzles.push({ name: "Caldecott Medal Books",
                     category: "English",
                     words: ["Black and White", "Drummer Hoff", "Golem", "Jumanji", "Many Moons", "Mei Li", "My Friend Rabbit", "One Fine Day", "Owl Moon", "Shadow", "Smoky Night", "Snowflake Bentley", "Snowy Day", "Song and Dance Man", "The Biggest Bear", "The Polar Express", "Time of Wonder", "Tree is Nice", "Tuesday"]
                    })
    puzzles.push({ name: "Charles Dickens Characters",
                     category: "English",
                     words: ["Agnes Flemming", "Biddy", "Bob Cratchit", "Charles Darnay", "Compeyson", "Ebenezer Scrooge", "Edwin Leeford", "Estella", "Jaggers", "Jarvis Lorry", "Joe Gargery", "Lucie Manette", "Magwitch", "Miss Havisham", "Miss Pross", "Noah Claypole", "Oliver Twist", "Orlick", "Pip", "Solomon Pross", "Sydney Carton", "Tiny Tim", "Wopsie"]
                    })
    puzzles.push({ name: "Children's Literary Characters",
                     category: "English",
                     words: ["Amelia Bedelia", "Charlotte", "Clifford", "Count Olaf", "Curious George", "Edmund Pevensie", "Harry Potter", "Henry  Huggins", "Hermione Granger", "Huck Finn", "Klaus Baudelaire", "Lucy Pevensie", "Peter Pevensie", "Peter Rabbit", "Pippi Longstocking", "Ramona Quimby", "Ribsy", "Ron Weasley", "Spot", "Sunny Baudelaire", "Susan Pevensie", "Templeton", "Tom Sawyer", "Violet Baudelaire", "Wilbur"]
                    })
    puzzles.push({ name: "Conjunctions",
                     category: "English",
                     words: ["after", "although", "and", "as", "as well as", "because", "before", "both", "but", "either", "for", "if", "neither", "nor", "not", "not only", "or", "since", "so", "than", "unless", "until", "when", "whether", "while"]
                    })
    puzzles.push({ name: "Famous American Authors",
                     category: "English",
                     words: ["Benjamin Franklin", "Dean Koontz", "Edgar Allan Poe", "Emily Dickinson", "Ernest Hemingway", "Gore Vidal", "Henry David Thoreau", "Herman Melville", "Isaac Asimov", "Jack Kerouac", "Jack London", "Jane Smiley", "John Grisham", "Jonathan Franzen", "Kurt Vonnegut", "Nathaniel Hawthorne", "Robert Ludlum", "Saul Bellow", "Stephen King", "Tom Clancy", "Tom Wolfe", "Vladimir Nabokov", "Walt Whitman"]
                    })
    puzzles.push({ name: "First Grade Dolch Sight Words",
                     category: "English",
                     words: ["after", "again", "an", "any", "as", "ask", "by", "could", "every", "fly", "from", "give", "going", "had", "has", "her", "him", "his", "how", "just", "know", "let", "live", "may", "of", "old", "once", "open", "over", "put", "round", "some", "stop", "take", "thank", "them", "then", "think", "walk", "were", "when", "with", "yes"]
                    })
    puzzles.push({ name: "Literary Devices",
                     category: "English",
                     words: ["Allegory", "Alliteration", "Allusion", "Analogue", "Anecdote", "Aphorism", "Aside", "Characterization", "Climax", "Comedy", "Conflict", "Denouement", "Dialogue", "Euphemism", "Foreshadowing", "Imagery", "Inference", "Irony", "Metaphor", "Metonymy", "Paradox", "Personification", "Rhythm", "Scansion", "Symbolism"]
                    })
    puzzles.push({ name: "Pre-Primer Dolch Sight Words",
                     category: "English",
                     words: ["a", "and", "away", "big", "blue", "can", "come", "down", "find", "for", "funny", "go", "help", "here", "in", "is", "it", "jump", "little", "look", "make", "me", "my", "not", "one", "play", "red", "run", "said", "see", "the", "three", "to", "two", "up", "we", "where", "yellow", "you"]
                    })
    puzzles.push({ name: "Primer Sight Words",
                     category: "English",
                     words: ["all", "am", "are", "at", "ate", "be", "black", "brown", "but", "came", "did", "do", "eat", "four", "get", "good", "have", "he", "into", "like", "must", "new", "no", "now", "on", "our", "out", "please", "pretty", "ran", "ride", "saw", "say", "she", "so", "soon", "that", "there", "they", "this", "too", "under", "want", "was", "well", "went", "what", "white", "who", "will", "with", "yes"]
                    })
    puzzles.push({ name: "Pulitzer Prize Winning Works",
                     category: "English",
                     words: ["A Death in the Family", "A Fable", "A Summons to Memphis", "A Thousand Acres", "Advise and Consent", "American Pastoral", "Andersonville", "Angle of Repose", "Beloved", "Breathing Lessons", "Elbow Room", "Empire Falls", "Foreign Affairs", "Gilead", "Guard of Honor", "House Made of Dawn", "Independence Day", "Ironweed", "Lonesome Dove", "March", "Middlesex", "Rabbit At Rest", "Rabbit Is Rich", "The Caine Mutiny", "The Color Purple", "The Edge of Sadness", "The Fixer", "The Hours", "The Killer Angels", "The Known World", "The Old Man and the Sea", "The Reivers", "The Road", "The Shipping News", "The Stone Diaries", "The Town", "The Way West", "To Kill a Mockingbird"]
                    })
    puzzles.push({ name: "Punctuation Marks",
                     category: "English",
                     words: ["accent", "ampersand", "apostrophe", "asterisk", "brace", "bracket", "breve", "caret", "colon", "comma", "dash", "decimal point", "ellipsis", "exclamation point", "hyphen", "macron", "paragraph", "parentheses", "period", "question mark", "semicolon", "slash", "tilde"]
                    })
    puzzles.push({ name: "Quantifiers",
                     category: "English",
                     words: ["a bit of", "a couple", "a few", "a good deal of", "a great deal of", "a lack of", "a little", "a lot of", "all", "enough", "few", "fewer", "fewest", "least", "little", "lots of", "many", "most", "much of", "no", "none", "not much", "plenty of", "several", "some"]
                    })
    puzzles.push({ name: "Second Grade Dolch Sight Words",
                     category: "English",
                     words: ["always", "around", "because", "been", "before", "best", "both", "but", "call", "cold", "does", "fast", "first", "five", "found", "gave", "goes", "green", "its", "made", "many", "off", "or", "pull", "read", "right", "sing", "sit", "sleep", "tell", "their", "these", "those", "upon", "us", "use", "very", "wash", "which", "why", "wish", "work", "would", "write", "your"]
                    })
    puzzles.push({ name: "Shakespeare Characters",
                     category: "English",
                     words: ["Antony", "Baptista", "Bianca", "Cassio", "Cleopatra", "Cressida", "Dauphin", "Desdemona", "Gremio", "Hamlet", "Henry V", "Horatio", "Iago", "Juliet", "Julius Caesar", "Katherina", "King Lear", "Macbeth", "Ophelia", "Othello", "Petruchio", "Romeo", "Titus Andronicus", "Troilus", "Tybalt"]
                    })
    puzzles.push({ name: "Shakespeare Plays",
                     category: "English",
                     words: ["Antony and Cleopatra", "As You Like It", "Cymbeline", "Hamlet", "Henry VIII", "Julius Caesar", "King Lear", "Macbeth", "Measure for Measure", "Othello", "Richard II", "Richard III", "Romeo and Juliet", "The Comedy of Errors", "The Tempest", "Titus Andronicus", "Troilus and Cressida", "Twelfth Night"]
                    })
    puzzles.push({ name: "Shakespearean Plays",
                     category: "English",
                     words: ["Antony and Cleopatra", "As You Like It", "Cymbeline", "Hamlet", "Henry VIII", "Julius Caesar", "King Lear", "Macbeth", "Measure for Measure", "Othello", "Richard II", "Richard III", "Romeo and Juliet", "The Comedy of Errors", "The Tempest", "Titus Andronicus", "Troilus and Cressida", "Twelfth Night"]
                    })
    puzzles.push({ name: "Synonyms For Happy",
                     category: "English",
                     words: ["beatific", "blissful", "blithe", "buoyant", "cheerful", "cheery", "delighted", "ecstatic", "elated", "enraptured", "entranced", "euphoric", "exhilarated", "exuberant", "exultant", "gay", "gladsome", "gratified", "intoxicated", "jocund", "jolly", "jovial ", "joyful", "jubilant", "lighthearted", "merry", "mirthful", "pleased", "rapturous", "rhapsodic ", "sanguine", "satisfied", "sunny", "thankful", "tickled", "upbeat"]
                    })
    puzzles.push({ name: "Synonyms for Red",
                     category: "English",
                     words: ["blooming", "blush", "brick", "burgundy ", "cardinal ", "carmine", "cerise", "cherry ", "chestnut", "claret", "copper", "coral ", "crimson", "dahlia ", "flaming ", "florid", "garnet", "magenta", "maroon", "puce", "sanguine ", "scarlet ", "titian ", "vermilion", "wine", "wine"]
                    })
    puzzles.push({ name: "Third Grade Dolch Sight Words",
                     category: "English",
                     words: ["about", "better", "bring", "carry", "clean", "cut", "done", "draw", "drink", "eight", "fall", "far", "found", "full", "gave", "goes", "got", "grow", "hold", "hurt", "if", "keep", "kind", "laugh", "light", "long", "much", "myself", "never", "only", "own", "pick", "seven", "shall", "show", "six", "small", "start", "ten", "today", "together", "try", "warm"]
                    })
    puzzles.push({ name: "Alphabet",
                     category: "English Language",
                     words: ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J J", "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t", "U u", "V v", "W w", "X x", "Y y", "Z z"]
                    })
    puzzles.push({ name: "Auto Antonyms",
                     category: "English Language",
                     words: ["bolt", "bound", "buckle", "buckle", "cleave", "clip", "custom", "dust", "fast", "fine", "hold up", "left", "over", "peer", "rent", "scan", "screen", "seed", "skin", "spare", "strike", "temper", "trim", "trip", "weather"]
                    })
    puzzles.push({ name: "Compound Words",
                     category: "English Language",
                     words: ["airport", "baseball", "bathroom", "clockwise", "downtown", "earring", "eyebrow", "fingernail", "goldfish", "haystack", "inside", "jigsaw", "lifetime", "moonlight", "newspaper", "overboard", "popcorn", "rowboat", "sailboat", "surfboard", "tablecloth", "underline", "viewpoint", "waterfall", "yearbook"]
                    })
    puzzles.push({ name: "English Words From Arabic",
                     category: "English Language",
                     words: ["almanac", "caliber", "carat", "coffee", "elixir", "gazelle", "giraffe", "hazard", "jar", "jasmine", "kohl", "lemon", "lilac", "lime", "magazine", "monsoon", "orange", "racket", "ream", "sash", "scarlet", "sofa", "sugar", "tambourine", "zero"]
                    })
    puzzles.push({ name: "Figures Of Speech",
                     category: "English Language",
                     words: ["allegory", "alliteration", "allusion", "anadiplosis", "anaphora", "apostrophe", "assonance", "consonance", "hyperbole", "irony", "isocolon", "litotes", "meiosis", "metalepsis", "metaphor", "metonymy", "neologism", "onomatopoeia", "oxymoron", "parenthesis", "personification", "pun", "simile", "syllepsis", "synecdoche"]
                    })
    puzzles.push({ name: "Heteronyms",
                     category: "English Language",
                     words: ["address", "axes", "bass", "compact", "conduct", "console", "contest", "deliberate", "dove", "excuse", "fine", "house", "invalid", "lead", "live", "minute", "object", "permit", "present", "rebel", "record", "separate", "tear", "wind", "wound"]
                    })
    puzzles.push({ name: "Homonyms",
                     category: "English Language",
                     words: ["aid - aide", "ant - aunt", "ball - bawl", "bare - bear", "be - bee", "cell - sell", "cent - scent", "close - clothes", "days - daze", "dear - deer", "dew - do", "ewe - you", "eye - I", "flour - flower", "hall - haul", "hour - our", "in - inn", "know - no", "mail - male", "or - oar", "pair - pear", "right - write", "sail - sale", "sea - see", "toe - tow"]
                    })
    puzzles.push({ name: "Irregular Plural Nouns",
                     category: "English Language",
                     words: ["alumni", "babies", "cacti", "children", "feet", "geese", "halves", "hooves", "kisses", "knives", "leaves", "lives", "loaves", "men", "mice", "nuclei", "people", "stories", "taxes", "teeth", "tomatoes", "tries", "volcanoes", "wolves", "women"]
                    })
    puzzles.push({ name: "Irregular Verbs",
                     category: "English Language",
                     words: ["be - was", "become - became", "begin - began", "bind - bound", "bite - bit", "break - broke", "catch - caught", "come - came", "dig - dug", "do - did", "eat - ate", "fall - fell", "feel - felt", "find - found", "get - got", "go - went", "have - had", "make - made", "meet - met", "pay - paid", "run - ran", "say - said", "see - saw", "teach - taught", "win  -  won"]
                    })
    puzzles.push({ name: "Onomatopoeia",
                     category: "English Language",
                     words: ["baa", "beep", "boom", "buzz", "chirp", "clang", "click", "crackle", "creak", "fizz", "hiss", "hoot", "howl", "hum", "moo", "neigh", "ping", "quack", "roar", "screech", "sizzle", "slurp", "splash", "thud", "thump"]
                    })
    puzzles.push({ name: "Oxymorons",
                     category: "English Language",
                     words: ["a little big", "all alone", "alone in a crowd", "awfully nice", "bad luck", "bitter sweet", "daily special", "dull roar", "front end", "good grief", "ill fortune", "jumbo shrimp", "never again", "nothing much", "old news", "positively negative", "restless sleep", "running idle", "single pair", "sound of silence", "still moving", "sweet pickle", "toll free", "top floor", "whole piece"]
                    })
    puzzles.push({ name: "Palindromes",
                     category: "English Language",
                     words: ["bib", "civic", "dad", "deed", "did", "eve", "eye", "gag", "gig", "kayak", "level", "madam", "mom", "mum", "noon", "nun", "peep", "pop", "pup", "radar", "refer", "rotator", "rotor", "toot", "wow"]
                    })
    puzzles.push({ name: "Phonics",
                     category: "English Language",
                     words: ["analogy phonics", "analytic phonics", "blend", "closed syllables", "cluster", "consonant blends", "consonant digraphs", "diphthongs", "embedded phonics", "grapheme", "letters", "long vowels", "mnemonics", "onset", "open syllables", "phonemes", "phonogram", "reading", "rime", "schwa", "short vowels", "sounds", "synthetic phonics", "vowel digraphs"]
                    })
    puzzles.push({ name: "Poetry",
                     category: "English Language",
                     words: ["ABC poem", "Haiku", "Tanka", "ballad", "ballade", "blank verse", "canzone", "cinquain", "classicism", "couplet", "elegy", "epic", "epigram", "epitaph", "free verse", "idyl", "lay", "limerick", "lyric", "narrative poetry", "ode", "quatrain", "rhyme", "sonnet", "verse"]
                    })
    puzzles.push({ name: "Poetry Terms",
                     category: "English Language",
                     words: ["accent", "anapaest", "dactyl", "elision", "envoy", "falling meter", "feminine rhyme", "foot", "heptameter", "heroic couplet", "hexameter", "iamb", "iambic pentameter", "persona", "refrain", "rhythm", "rising meter", "spondee", "stanza", "stress", "tetrameter", "trochee", "trope", "verse", "versification"]
                    })
    puzzles.push({ name: "Prefixes",
                     category: "English Language",
                     words: ["ab", "ad", "ante", "anti", "be", "co", "counter", "dis", "en", "ex", "hyper", "hypo", "in", "inter", "intra", "non", "out", "over", "post", "pre", "pro", "re", "sub", "un"]
                    })
    puzzles.push({ name: "Prepositions",
                     category: "English Language",
                     words: ["about", "above", "across", "after", "among", "at", "before", "beside", "between", "beyond", "by", "down", "during", "except", "for", "from", "in", "into", "near", "off", "on", "over", "through", "to", "toward"]
                    })
    puzzles.push({ name: "Pronouns",
                     category: "English Language",
                     words: ["all", "he", "her", "her", "hers", "him", "his", "it", "its", "me", "mine", "my", "our", "ours", "she", "their", "theirs", "them", "they", "us", "we", "you", "your", "yours"]
                    })
    puzzles.push({ name: "Sentences",
                     category: "English Language",
                     words: ["complex sentence", "compound predicate", "compound sentence", "dependent clause", "direct object", "finite verb", "imperative sentence", "independent clause", "indirect object", "non-finite verb", "noun", "phrase", "predicate", "predicate adjective", "simple predicate", "simple sentence", "subject", "subject complement", "verb", "verb complement"]
                    })
    puzzles.push({ name: "Suffixes",
                     category: "English Language",
                     words: ["able", "ade", "age", "an", "ant", "ate", "cian", "cy", "dom", "ee", "en", "ence", "er", "ese", "ful", "fy", "hood", "ic", "ish", "ism", "ist", "less", "ly", "ment", "ness"]
                    })
    puzzles.push({ name: "Toponyms",
                     category: "English Language",
                     words: ["Angora", "Armageddon", "Babel", "Bohemian", "Bordeaux", "Broadway", "Brussels Sprout", "Burgundy", "Calico", "Canary", "Champagne", "China", "Cognac", "Danish", "Denim", "Magenta", "Mecca", "Paisley", "Rugby", "Sardine", "Seltzer", "Shanghai", "Sherry", "Timbuktu", "Trojan Horse"]
                    })
    puzzles.push({ name: "80s TV Shows",
                     category: "Entertainment",
                     words: ["A-Team", "ALF", "Bosom Buddies", "Charles in Charge", "Cheers", "Coach", "Falcon Crest", "Family Ties", "Full House", "Golden Girls", "Growing Pains", "Highway to Heaven", "Hogan Family", "Night Court", "Out of This World", "Perfect Strangers", "Punky Brewster", "Saved By The Bell", "The Cosby Show"]
                    })
    puzzles.push({ name: "80s TV Shows 2",
                     category: "Entertainment",
                     words: ["Cops", "Different World", "Dynasty", "Empty Nest", "Fall Guy", "Fame", "Gimme A Break", "Kate and Allie", "Knight Rider", "MacGyver", "Major Dad", "Matlock", "Moonlighting", "Murder She Wrote", "Murphy Brown", "My Two Dads", "Newhart", "Quantum Leap", "Too Close For Comfort", "Webster", "Wonder Years"]
                    })
    puzzles.push({ name: "90s TV Shows",
                     category: "Entertainment",
                     words: ["Ally McBeal", "Baywatch", "Beastmaster", "Becker", "Blossom", "Boy Meets World", "Caroline in The City", "Charmed", "Chicago Hope", "Clueless", "Cosby", "Cybill", "ER", "Fantasy Island", "Ned and Stacey", "News Radio", "Norm", "Northern Exposure", "The Net"]
                    })
    puzzles.push({ name: "90s TV Shows 2",
                     category: "Entertainment",
                     words: ["Felicity", "Frasier", "Friends", "Highlander", "Home Improvement", "Hyperion Bay", "JAG", "Judging Amy", "King of Queens", "Law and Order", "Mad About You", "Martin", "Melrose Place", "NYPD Blue", "Seinfeld", "Spin City", "Star Trek Voyager", "The Nanny", "The Practice", "The Sopranos", "The West Wing", "Twin Peaks", "Walker Texas Ranger", "Wings"]
                    })
    puzzles.push({ name: "90s Talk Shows ",
                     category: "Entertainment",
                     words: ["Arsenio Hall", "Donahue", "Forgive or Forget", "Gabrielle Carteris", "Geraldo", "Jane", "Jay Leno", "Jenny Jones", "Leeza", "Maury Povich", "Montel Williams", "Oprah ", "Ricki Lake", "Rush Limbaugh", "Sally Jesse Raphael", "Tempestt", "The Joy Brown Show", "Whoopi"]
                    })
    puzzles.push({ name: "Academy Award Winners: Best Actor",
                     category: "Entertainment",
                     words: ["Al Pacino", "Ben Kingsley", "Bing Crosby", "Charles Laughton", "Charlton Heston", "Clark Gable", "Daniel Day-Lewis", "Denzel Washington", "Dustin Hoffman", "Fredric March", "Gary Cooper ", "Humphrey Bogart", "Jack Nicholson", "James Cagney", "James Stewart", "Jamie Foxx", "Laurence Olivier", "Lionel Barrymore", "Marlon Brando", "Robert Duvall", "Roberto Benigni", "Sidney Poitier", "Spencer Tracy", "Tom Hanks", "Yul Brenner"]
                    })
    puzzles.push({ name: "Academy Award Winners: Best Actress",
                     category: "Entertainment",
                     words: ["Anne Bancroft", "Audrey Hepburn", "Barbra Streisand", "Bette Davis", "Elizabeth Taylor", "Ellen Burstyn", "Greer Garson", "Hilary Swank", "Ingrid Bergman", "Jane Fonda", "Jodie Foster", "Judi Dench", "Judy Holiday", "Julie Andrews", "Kate Winslet", "Katharine Hepburn", "Louise Fletcher", "Marlee Matlin", "Meryl Streep", "Olivia de Havilland", "Patty Duke", "Sally Field", "Shirley Maclaine", "Sissy Spacek", "Vivien Leigh"]
                    })
    puzzles.push({ name: "Academy Award Winners: Best Picture",
                     category: "Entertainment",
                     words: ["A Beautiful Mind", "Annie Hall", "Ben-Hur", "Braveheart", "Casablanca", "Chariots of Fire", "Cimarron", "Crash", "Dances With Wolves", "Forrest Gump", "From Here to Eternity", "Gandhi", "Gone With the Wind", "Hamlet", "My Fair Lady", "Out of Africa", "Rain Man", "Slumdog Millionaire", "Sunrise", "The Sound of Music", "West Side Story", "Wings"]
                    })
    puzzles.push({ name: "Alice in Wonderland Characters",
                     category: "Entertainment",
                     words: ["Alice", "Bill", "Caterpillar", "Cheshire Cat", "Daisies", "Dinah", "Dodo", "Dormouse", "Duchess", "Eaglet", "Fawn", "Frog-Footman", "Jabberwocky", "King of Hearts", "Knave of Hearts", "Lory", "Mad Hatter", "Mouse", "Pat", "Red Queen", "Stayne", "Tweedledee", "Tweedledum", "White Queen", "White Rabbit"]
                    })
    puzzles.push({ name: "Care Bears",
                     category: "Entertainment",
                     words: ["All My Heart", "Baby Hugs", "Bashful", "Bedtime", "Birthday", "Cheer", "Daydream", "Friend", "Funshine", "Good Luck", "Grumpy", "Heartsong", "Hopeful Heart", "Laugh-A-Lot", "Love-A-Lot", "Messy", "Oopsy", "Proud Heart", "Secret", "Share", "Superstar", "Surprise", "Tenderheart", "True Heart", "Wish"]
                    })
    puzzles.push({ name: "Clone Wars Characters",
                     category: "Entertainment",
                     words: ["Anakin Skywalker", "Asaji Ventress", "Battle Droids", "Beru", "Cliegg Lars", "Clone Trooper", "Corde", "Count Dooku", "Darth Tyranus", "Dexter Jettster", "Dorme", "Jango Fett", "Jar Jar Binks", "Kit Fisto", "Mace Windu", "Owen Lars", "Padme Amidala", "Plo Koon", "Queen Jamillia", "Rotta the Huttlet", "Shmi Skywalker", "Sio Bibble", "Watto", "Zam Wesell"]
                    })
    puzzles.push({ name: "Disney Movies",
                     category: "Entertainment",
                     words: ["A Tiger Walks", "Alice in Wonderland ", "Cinderella", "Johnny Tremain ", "Jungle Cat", "Lady and the Tramp", "Old Yeller", "Peter Pan ", "The African Lion", "The Gnome-Mobile", "The Littlest Outlaw", "The Living Desert", "The Shaggy Dog", "The Sword and the Rose", "Tonka", "Treasure Island ", "White Wilderness"]
                    })
    puzzles.push({ name: "Female Disney Characters",
                     category: "Entertainment",
                     words: ["Alice", "Ariel", "Aurora", "Belle", "Cinderella", "Cruella DeVille", "Daisy Duck", "Dory", "Duchess", "Giselle", "Jasmine", "Lady", "Madame Medusa", "Maid Marian", "Maleficent", "Meg", "Minnie Mouse", "Mulan", "Nala", "Pocohontas", "Queen of Hearts", "Snow White", "Tinkerbell", "Ursula", "Wendy"]
                    })
    puzzles.push({ name: "Harry Potter Characters",
                     category: "Entertainment",
                     words: ["Albus Dumbledore", "Bellatrix Lestrange", "Cedric Diggory", "Cho Chang", "Cornelius Fudge", "Draco Malfoy", "Ginny Weasley", "Harry Potter", "Hermione Granger", "Katie Bell", "Minerva McGonagall", "Moaning Myrtle", "Neville Longbottom", "Oliver Wood", "Parvati Patel", "Remus Lupin", "Ron Weasley", "Rubeus Hagrid", "Seamus Finnigan", "Severus Snape", "Sirius Black", "Viktor Krum", "Vincent Crabbe", "Voldemort", "Wormtail"]
                    })
    puzzles.push({ name: "Male Disney Characters",
                     category: "Entertainment",
                     words: ["Aladdin", "Bambi", "Beast", "Buzz Lightyear", "Donald Duck", "Gaston", "Hercules", "John Smith", "Marlin", "Mickey Mouse", "Nemo", "Peter Pan", "Pluto", "Pongo", "Prince Charming", "Prince Eric", "Prince Phillip", "Quasimodo", "Robin Hood", "Simba", "Sulley", "Tarzan", "Tramp", "Woody"]
                    })
    puzzles.push({ name: "Movies Based on True Stories",
                     category: "Entertainment",
                     words: ["A Beautiful Mind", "A Mighty Heart", "Black Hawk Down", "Braveheart", "Catch Me If You Can", "Flags of Our Fathers", "Gandhi", "La Bamba", "Lean On Me", "Men of Honor", "Norma Rae", "Patch Adams", "Ray", "Remember The Titans", "Rudy", "The Aviator", "The Elephant Man", "The Miracle Worker", "The Pianist", "Walk the Line"]
                    })
    puzzles.push({ name: "Movies Based on True Stories 2",
                     category: "Entertainment",
                     words: ["Ali", "Alive", "Amelia", "Antwone Fisher", "Awakenings", "Dangerous Minds", "Elizabeth", "Erin Brockovich", "Finding Neverland", "Freedom Writers", "Hotel Rwanda", "JFK", "My Left Foot", "October Sky", "Prefontaine", "Selena", "The Blind Side", "The Hurricane", "The Ten Commandments"]
                    })
    puzzles.push({ name: "Sports Themed Movies",
                     category: "Entertainment",
                     words: ["Ali", "Bad News Bears", "Bull Durham", "Chariots of Fire", "Cinderella Man", "Cool Runnings", "Fever Pitch", "Hoosiers", "Jerry Maguire", "Prefontaine", "Rocky", "Running Brave", "Sea Biscuit", "Slap Shot", "The Babe", "The Champ", "The Cutting Edge", "The Karate Kid", "The Longest Yard", "Tin Cup", "Vision Quest", "Without Limits"]
                    })
    puzzles.push({ name: "Star Wars Characters",
                     category: "Entertainment",
                     words: ["Admiral Piett", "Ben Obi-Wan Kenobi", "Bib Fortuna", "Boba Fett", "Chewbacca", "Chief Jawa", "Darth Vader", "Emperor", "Ewok", "Grand Moff Tarkin", "Greedo", "Han Solo", "Jabba the Hutt", "Lando Calrissian", "Logray", "Luke Skywalker", "Mon Mothma", "Princess Leia", "Stormtrooper", "Takeel", "Teebo", "Wicket", "Yoda"]
                    })
    puzzles.push({ name: "Superheroes",
                     category: "Entertainment",
                     words: ["Aquaman", "Batman", "Captain America", "Captain Marvel", "Conan the Barbarian", "Daredevil", "Hawkman", "Iceman", "Incredible Hulk", "Iron Man", "Magneto", "Nightcrawler", "Optimus Prime", "Robin", "Rogue", "Sandman", "Spiderman", "Supergirl", "Superman", "The Bionic Man", "The Bionic Woman", "Wolverine", "Wonder Woman"]
                    })
    puzzles.push({ name: "Top Baby Names of 2010: Boys",
                     category: "Entertainment",
                     words: ["Aiden", "Alexander", "Andrew", "Anthony", "Benjamin", "Christian", "Christopher", "Daniel", "David", "Elijah", "Ethan", "Gabriel", "Jacob", "James", "Jayden", "John", "Joseph", "Joshua", "Logan", "Matthew", "Michael", "Nathan", "Noah", "Ryan", "William"]
                    })
    puzzles.push({ name: "Top Baby Names of 2010: Girls",
                     category: "Entertainment",
                     words: ["Abigail", "Addison", "Alexis", "Alyssa", "Ashley", "Ava", "Brianna", "Chloe", "Elizabeth", "Ella", "Emily", "Emma", "Grace", "Hailey", "Hannah", "Isabella", "Lily", "Madison", "Mia", "Natalie", "Olivia", "Samantha", "Sarah", "Sophia", "Taylor"]
                    })
    puzzles.push({ name: "Top Grossing Films",
                     category: "Entertainment",
                     words: ["Alice in Wonderland", "Avatar", "Finding Nemo", "Forrest Gump", "Independence Day", "Jurassic Park", "Ratatouille", "The Da Vinci Code", "The Dark Knight", "The Lion King", "The Matrix Reloaded", "The Sixth Sense", "Titanic", "Transformers", "Up"]
                    })
    puzzles.push({ name: "Twilight Characters",
                     category: "Entertainment",
                     words: ["Alice Cullen", "Angela Weber", "Bella Swan", "Billy Black", "Carlisle Cullen", "Charlie Swan", "Edward Cullen", "Embry Call", "Emily Young", "Emmett Cullen", "Ephraim Black", "Eric Yorkie", "Esme Cullen", "Harry Clearwater", "Jacob Black", "James", "Jasper Hale", "Jessica Stanley", "Laurent", "Mike Newton", "Paul", "Quil Ateara", "Rosalie Cullen", "Sam Uley", "Victoria"]
                    })
    puzzles.push({ name: "Unusual Celebrity Baby Names",
                     category: "Entertainment",
                     words: ["Alabama", "Apple", "Audio", "Bluebell", "Bronx", "Brooklyn", "Coco", "Cruz", "Denim", "Honor", "Hopper", "Indiana", "Kal-El", "Kingston", "Knox", "Maddox", "Pax", "Poet", "River", "Rowan", "Seraphina", "Shiloh", "Sunday", "Suri", "Zuma"]
                    })
    puzzles.push({ name: "X-Men Characters",
                     category: "Entertainment",
                     words: ["Angel", "Beast", "Changeling", "Colossus", "Cyclops", "Dazzler", "Flea", "Iceman", "Lockheed", "Magneto", "Marrow", "Mimic", "Mystique", "Nightcrawler", "Phoenix", "Polaris", "Professor Xavier", "Rogue", "Shadowcat", "Storm", "Sunfire", "Sway", "Thunderbird", "Vulcan", "Wolverine"]
                    })
    puzzles.push({ name: "African Cities",
                     category: "Geography",
                     words: ["Alexandria", "Algiers", "Asmara", "Bamako", "Banjul", "Bissau", "Cairo", "Cape Town", "Casablanca", "Dakar", "Douala", "Durban", "Harare", "Johannesburg", "Kaduna", "Kano", "Kumasi", "Lagos", "Lome", "Mogadishu", "Mombasa", "Nairobi", "Oran", "Tripoli", "Tunis"]
                    })
    puzzles.push({ name: "African Countries",
                     category: "Geography",
                     words: ["Algeria", "Angola", "Botswana", "Burkina Faso", "Cameroon", "Congo", "Egypt", "Ethiopia", "Ghana", "Kenya", "Madagascar", "Malawi", "Mali", "Morocco", "Niger", "Nigeria", "Senegal", "South Africa", "Sudan", "Tanzania", "Tunisia", "Uganda", "Zambia", "Zimbabwe"]
                    })
    puzzles.push({ name: "African Mountains",
                     category: "Geography",
                     words: ["Ahaggar", "Baker", "Cameroon", "Drakensberg", "Elgon", "Emi Koussi", "Emin", "Gessi", "Jbel Toubkal", "Kadam", "Karisimbi", "Kenya", "Kilimanjaro", "Kinyeti", "Meru", "Moco", "Moroto", "Morungle", "Mulanje", "Ras Dejen", "Rungwe", "Speke", "Stanley", "Table Mountain", "Zulia"]
                    })
    puzzles.push({ name: "African Tribes",
                     category: "Geography",
                     words: ["Afar", "Amhara", "Anlo-Ewe", "Ashanti", "Bakongo", "Bambara", "Bemba", "Berber", "Bobo", "Chewa", "Dogon", "Fang", "Fon", "Fulani", "Ibos", "Kikuyu", "Maasai", "Mandinka", "Pygmies", "Samburu", "Senufo", "Tuareg", "Wolof", "Yoruba", "Zulu"]
                    })
    puzzles.push({ name: "Airports in California",
                     category: "Geography",
                     words: ["Benton Field ", "Gansner Field", "Haigh Field", "Happy Camp Airport", "Hayfork Airport", "Hemet-Ryan Airport", "Hoopa Airport", "Kern Valley Airport", "Kneeland Airport", "Lake Tahoe Airport", "Lampson Field", "Lee Vining Airport", "Little River Airport", "Lompoc Airport", "Lone Pine Airport", "McClellan Airfield ", "Mesa Del Rey Airport", "Murray Field", "Needles Airport", "Oakdale Airport", "Placerville Airport", "Ruth Airport", "Santa Ynez Airport", "Shelter Cove Airport"]
                    })
    puzzles.push({ name: "American Cities",
                     category: "Geography",
                     words: ["Albuquerque", "Atlanta", "Boston", "Buffalo", "Chicago", "Cincinnati", "Cleveland", "Dallas", "Denver", "Detroit", "Houston", "Indianapolis", "Jacksonville", "Los Angeles", "Miami", "New York", "Philadelphia", "Phoenix", "Pittsburgh", "San Antonio", "San Diego", "San Francisco", "San Jose", "Seattle", "Washington"]
                    })
    puzzles.push({ name: "American Mountain Ranges",
                     category: "Geography",
                     words: ["Adirondack", "Aleutian", "Appalachian", "Bighorn", "Black Hills", "Blue Ridge", "Boulder", "Cariboo", "Cascade", "Diablo", "Elkhorn", "Flathead", "Great Smoky", "Olympic", "Ozark", "Pioneer", "Rocky", "Santa Cruz", "Santa Monica", "Sierra Madre", "Sierra Nevada", "Teton", "Wasatch", "Wind River", "Wyoming"]
                    })
    puzzles.push({ name: "Arctic Communities",
                     category: "Geography",
                     words: ["Arviat", "Cambridge Bay", "Cape Dorset", "Cree", "Inuktitut", "Iqaluit", "Micmac", "Montagnais-Naskapi", "Ojibway", "Pangnirtung", "Pond Inlet", "Rankin Inlet", "all-terrain vehicles", "bombardiers", "boots", "dogsleds", "igloos", "lead mines", "motorboats", "parka", "silver mines", "snowmobiles", "tents"]
                    })
    puzzles.push({ name: "Asian Cities",
                     category: "Geography",
                     words: ["Aden", "Amman", "Ankara", "Baghdad", "Bangkok", "Beijing", "Beirut", "Bombay", "Calcutta", "Delhi", "Dhaka", "Gaza", "Hanoi", "Jerusalem", "Kabul", "Karachi", "Kyoto", "Lhasa", "Manila", "Osaka", "Seoul", "Shanghai", "Singapore", "Tokyo", "Wuhan"]
                    })
    puzzles.push({ name: "Asian Languages",
                     category: "Geography",
                     words: ["Bengali", "Burmese", "Cantonese", "English", "Hakka", "Hindi", "Indonesian", "Japanese", "Javanese", "Kashmiri", "Kazakh", "Korean", "Kurdish", "Malay", "Mandarin", "Mongolian", "Persian", "Punjabi", "Russian", "Sanskrit", "Tamil", "Thai", "Tibetan", "Turkish", "Uzbek"]
                    })
    puzzles.push({ name: "Asian Mountains",
                     category: "Geography",
                     words: ["Annapurna", "Broad Peak", "Cho Oyu", "Everest", "Gyala Peri", "Kamet", "Kanjut Sar", "Laila Peak", "Lhoste", "Machapucchhre", "Makalu", "Manaslu", "Masherbrum", "Melungste", "Mitre Peak", "Namcha Barwa", "Nanda Devi", "Nanga Parbat", "Passu Sar", "Pumori", "Shisha Pangma", "Shivling", "Ultar Peak"]
                    })
    puzzles.push({ name: "Australian Cities",
                     category: "Geography",
                     words: ["Albury", "Armidale", "Bathurst", "Broken Hill", "City of Canterbury", "City of Randwick", "City of Ryde", "Coffs Harbour", "Dubbo", "Gosford", "Goulburn", "Grafton", "Griffith", "Lismore", "Lithgow", "Maitland", "Newcastle", "Nowra", "Orange", "Queanbeyan", "Sydney", "Tamworth", "Wagga Wagga", "Wollogong", "cessnock"]
                    })
    puzzles.push({ name: "California Cities",
                     category: "Geography",
                     words: ["Anaheim", "Burbank", "Carlsbad", "Concord", "Fremont", "Irvine", "Laguna Beach", "Long Beach", "Los Angeles", "Malibu", "Monterey", "Napa", "Newport Beach", "Oakland", "Palm Springs", "Redding", "Sacramento", "San Diego", "San Francisco", "San Jose", "Santa Barbara", "Santa Cruz", "Tracy", "Ventura", "West Hollywood"]
                    })
    puzzles.push({ name: "Canadian Cities",
                     category: "Geography",
                     words: ["Ajax", "Brampton", "Burlington", "Calgary", "Cambridge", "Cape Breton", "Delta", "Edmonton", "Halifax", "Hamilton", "Kingston", "Langley", "Levis", "Montreal", "Niagara Falls", "Norfolk", "Ottawa", "Peterborough", "Quebec City", "Richmond", "Surrey", "Toronto", "Vancouver", "Victoria"]
                    })
    puzzles.push({ name: "Canadian Provinces Territories And Their Capitals",
                     category: "Geography",
                     words: ["Alberta", "British Columbia", "Charlottetown", "Edmonton", "Fredericton", "Halifax", "Iqaluit", "Manitoba", "New Brunswick", "Newfoundland", "Nova Scotia", "Nunavut", "Ontario", "Prince Edward Island", "Quebec", "Quebec City", "Regina", "Saskatchewan", "Toronto", "Victoria", "Whitehorse", "Winnipeg", "Yellowknife", "Yukon"]
                    })
    puzzles.push({ name: "Cities Of New Mexico",
                     category: "Geography",
                     words: ["Albuquerque", "Artesia", "Aztec", "Belen", "Bloomfield", "Capitan", "Carlsbad", "Clovis", "Deming", "Espanola", "Farmington", "Grants", "Hobbs", "Las Alamos", "Las Cruces", "Portales", "Raton", "Rio Rancho", "Roswell", "Santa Fe", "Silver City", "Socorro", "Taos", "Tucumcari"]
                    })
    puzzles.push({ name: "Cities in Alaska",
                     category: "Geography",
                     words: ["Anchorage", "Barrow", "Bethel", "Cordova", "Craig", "Dillingham", "Fairbanks", "Haines", "Homer", "Houston", "Juneau", "Kenai", "Kodiak", "Kotzebue", "Nome", "Palmer", "Petersburg", "Sand Point", "Seward", "Sitka", "Skagway", "Soldotna", "Valdez", "Wasilla", "Wrangell"]
                    })
    puzzles.push({ name: "Cities in France",
                     category: "Geography",
                     words: ["Arles", "Avignon", "Bayonne", "Blois", "Bordeaux", "Cannes", "Carcassonne", "Dijon", "Evreux", "La Rochelle", "Laval", "Limoges", "Marseille", "Montpellier", "Nanterre", "Paris", "Pessac", "Poitiers", "Quimper", "Rennes", "Saint-Etienne", "Strasbourg", "Toulon", "Versailles", "Vichy"]
                    })
    puzzles.push({ name: "Cities in Italy",
                     category: "Geography",
                     words: ["Ancona", "Bari", "Benevento", "Bologna", "Brindisi", "Cagliari", "Catania", "Florence", "Fondi", "Gaeta", "Genova", "Livorno", "Milan", "Milazzo", "Napoli", "Palermo", "Rome", "Salerno", "Siena", "Syracuse", "Trapani", "Trieste", "Turin", "Venice", "Verona"]
                    })
    puzzles.push({ name: "Cities in Spain",
                     category: "Geography",
                     words: ["Alicante", "Asturias", "Avila", "Badalona", "Barcelona", "Bilbao", "Gijon", "Girona", "Granada", "Guadalajara", "Huesca", "Las Palmas", "Lleida", "Lugo", "Madrid", "Malaga", "Murcia", "Navarra", "Palma", "Sevilla", "Teruel", "Valencia", "Vigo", "Vitora", "Zaragoza"]
                    })
    puzzles.push({ name: "Cities of South America",
                     category: "Geography",
                     words: ["Asuncion", "Barcelona", "Belem", "Bogota", "Buenos Aires", "Cali", "Caracas", "Cordoba", "Georgetown", "Iquitos", "La Paz", "La Plata", "Lima", "Mendoza", "Montevideo", "Natal", "Quito", "Recife", "Rio de Janeiro", "Rosario", "Salvador", "Santa Fe", "Sao Paulo", "Sucre", "Valencia"]
                    })
    puzzles.push({ name: "Commonwealth Of Nations",
                     category: "Geography",
                     words: ["Antigua and Barbuda", "Australia", "Bangladesh", "Barbados", "Belize", "Botswana", "Brunei Darussalam", "Cameroon", "Canada", "Cyprus", "Dominica", "Fiji Islands", "Ghana", "Grenada", "Guyana", "India", "Jamaica", "Kenya", "Kiribati", "Lesotho", "Malawi", "Malaysia", "Maldives", "Malta", "Mauritius", "Mozambique", "Namibia", "Nauru", "New Zealand", "Nigeria", "Pakistan", "Papua New Guinea", "Samoa", "Seychelles", "Sierra Leone", "Singapore", "Solomon Islands", "South Africa", "Sri Lanka", "St Kitts and Nevis", "St Lucia", "Swaziland", "The Bahamas", "The Gambia", "Tonga", "Trinidad and Tobago", "Tuvalu", "Uganda", "United Kingdom", "Vanuatu", "Zambia"]
                    })
    puzzles.push({ name: "Countries",
                     category: "Geography",
                     words: ["Argentina", "Australia", "Brazil", "Canada", "Chile", "China", "Cuba", "Denmark", "Egypt", "England", "France", "Germany", "Greece", "Ireland", "Italy", "Japan", "Mexico", "Nigeria", "Peru", "Russia", "Scotland", "Spain", "Turkey", "USA", "Venezuela"]
                    })
    puzzles.push({ name: "East Coast Ski Resorts",
                     category: "Geography",
                     words: ["Arrowhead", "Baker Mountain", "Black Mountain", "Burke Mountain", "Butternut", "Camden Snow Bowl", "Eaton Mountain", "Granite Gorge", "Greek Peak", "Holiday Valley", "King Pine", "Lost Valley", "Mad River Glen", "Mohawk Mountain", "Mount Prospect", "Mount Snow", "Otis Ridge", "Pats Peak", "Ragged Mountain", "Ski Sundown", "Ski Ward", "Stowe Mountain", "Wildcat Mountain", "Willard Mountain"]
                    })
    puzzles.push({ name: "European Capitals",
                     category: "Geography",
                     words: ["Amsterdam", "Athens", "Belgrade", "Berlin", "Brussels", "Bucharest", "Budapest", "Copenhagen", "Dublin", "Helsinki", "Lisbon", "London", "Madrid", "Minsk", "Monaco", "Moscow", "Oslo", "Paris", "Prague", "Rome", "Sarajevo", "Stockholm", "Vienna", "Warsaw", "Zagreb"]
                    })
    puzzles.push({ name: "European Mountains",
                     category: "Geography",
                     words: ["Bietschhorn", "Dachstein", "Dom", "Eiger", "Gran Paradiso", "Jungfrau", "Klein Matterhorn", "Liskamm", "Matterhorn", "Mont Blanc", "Monte Rosa", "Nadelhorn", "Nordend", "Ortler", "Pelvoux", "Pilatus", "Piz Bernina", "Rigi", "Schneeberg", "Sciliar", "Titlis", "Traunstein", "Triglav", "Weisshorn", "Weissmies"]
                    })
    puzzles.push({ name: "Geographical Features",
                     category: "Geography",
                     words: ["bay", "butte", "canyon", "cape", "cave", "channel", "cliff", "cove", "delta", "dune", "fault", "fjord", "geyser", "glacier", "gulf", "hill", "loess", "mesa", "mountain", "peninsula", "plain", "plateau", "straight", "valley", "wetland"]
                    })
    puzzles.push({ name: "Geography Vocabulary",
                     category: "Geography",
                     words: ["Earth", "North Pole", "Prime Meridian", "South Pole", "Tropic of Cancer", "Tropic of Capricorn", "axis", "east", "equator", "equinox", "great circle", "hemisphere", "latitude", "lines of latitude", "lines of longitude", "longitude", "meridians", "north", "parallels", "south", "sphere", "west"]
                    })
    puzzles.push({ name: "Hawaiian Geography",
                     category: "Geography",
                     words: ["Akaka Falls", "Diamond Head", "Hanauma Bay", "Hilo", "Iolani Palace", "Ko Olina", "Kona Coast", "Mauna Loa", "Pearl Harbor", "coconut", "coral", "hibiscus", "lava", "lei", "luau", "macadamia nut", "palms", "papaya", "pineapple", "plantation", "poi", "sugar cane", "taro", "ukulele", "volcano"]
                    })
    puzzles.push({ name: "Honeymoon Destinations",
                     category: "Geography",
                     words: ["Aruba", "Australia", "Bahamas", "Bali", "Barbados", "Belize", "Bermuda", "California", "Cayman Islands", "Costa Rica", "Fiji", "Florida", "France", "Greece", "Hawaii", "Italy", "Jamaica", "Las Vegas", "Mexico", "New Zealand", "South Africa", "Tahiti", "Thailand"]
                    })
    puzzles.push({ name: "Islands",
                     category: "Geography",
                     words: ["Antigua", "Aruba", "Baffin", "Bali", "Barbados", "Borneo", "Catalina", "Corsica", "Crete", "Cuba", "Curacao", "Grand Cayman", "Great Britain", "Grenada", "Guam", "Hawaii", "Honshu", "Iceland", "Ireland", "Jamaica", "Java", "Long Island", "Madagascar", "Malta", "Man"]
                    })
    puzzles.push({ name: "Languages Of The World",
                     category: "Geography",
                     words: ["Albanian", "Arabic", "Armenian", "Bantu", "Bengali", "Chinese", "Creole", "Danish", "English", "French", "Gaelic", "Greek", "Hebrew", "Hindi", "Italian", "Japanese", "Korean", "Latin", "Polish", "Punjabi", "Romanian", "Russian", "Spanish", "Swahili", "Vietnamese"]
                    })
    puzzles.push({ name: "Largest Cities In US",
                     category: "Geography",
                     words: ["Austin", "Baltimore", "Boston", "Charlotte", "Chicago", "Columbus", "Dallas", "Detroit", "El Paso", "Fort Worth", "Hempstead", "Houston", "Indianapolis", "Jacksonville", "Los Angeles", "Memphis", "Milwaukee", "New York", "Philadelphia", "Phoenix", "San Antonio", "San Diego", "San Francisco", "San Jose"]
                    })
    puzzles.push({ name: "Major Airlines",
                     category: "Geography",
                     words: ["Air Canada", "Air China", "Air France", "Air Jamaica", "Alaksa", "Aloha", "America West", "American", "British Airways", "British Midland", "Continental", "Delta", "Jetblue", "Korean Air", "Lufthansa", "Mexicana", "Midway", "National", "Northwest", "Pan American", "Southwest", "Swiss", "US Airways", "United", "Virgin Atlantic"]
                    })
    puzzles.push({ name: "Manhattan Neighborhoods",
                     category: "Geography",
                     words: ["Battery Park City", "Central Park", "Chelsea", "China Town", "El Barrio", "Flatiron District", "Garment District", "Gramercy Park", "Greenwich Village", "Hamilton Heights", "Harlem", "Inwood", "Little Italy", "Lower East Side", "Midtown East", "Midtown West", "Soho", "Sugar Hill", "The East Village", "Theater District", "Tribeca", "Upper East Side", "Upper West Side", "Washington Heights"]
                    })
    puzzles.push({ name: "Middle Eastern Countries and Capitals",
                     category: "Geography",
                     words: ["Algeria", "Algiers", "Ankara", "Baghdad", "Bahrain", "Cairo", "Damascus", "Doha", "Egypt", "Iran", "Iraq", "Israel ", "Jerusalem", "Libya", "Manama", "Morocco", "Qatar", "Rabat", "Riyadh", "Saudi Arabia", "Syria", "Teheran", "Tripoli", "Turkey", "Yemen"]
                    })
    puzzles.push({ name: "Midwestern Ski Resorts",
                     category: "Geography",
                     words: ["Afton Alps", "Alpine Valley", "Buck Hill", "Cascade Mountain", "Challenge Mountain", "Garland Resort", "Giants Ridge", "Granite Peak", "Mount Bohemia", "Mount Kato", "Mount Ripley", "Pine Mountain", "Powder Ridge", "Riverside Hills", "Ski Brule", "Ski Gull", "Ski Snowstar", "The Homestead", "Timber Ridge", "Treetops", "Villa Olivia"]
                    })
    puzzles.push({ name: "Netherland Cities",
                     category: "Geography",
                     words: ["Almelo", "Amsterdam", "Arnhem", "Assen", "Breda", "Delft", "Den Helder", "Deventer", "Edam", "Ede", "Emmen", "Gouda", "Groningen", "Helmond", "Hoorn", "Leiden", "Middelburg", "Rotterdam", "The Hague", "Tilburg", "Utrecht", "Velsen", "Venlo", "Zeist", "Zutphen"]
                    })
    puzzles.push({ name: "New York Cities",
                     category: "Geography",
                     words: ["Albany", "Auburn", "Beacon", "Buffalo", "Cohoes", "Corning", "Dunkirk", "Elmira", "Fulton", "Geneva", "Hudson", "Ithaca", "Jamestown", "Little Falls", "Middletown", "New York City", "Niagara Falls", "Oneida", "Poughkeepsie", "Rochester", "Saratoga Springs", "Syracuse", "Troy", "White Plains", "Yonkers"]
                    })
    puzzles.push({ name: "Olympic Host Cities",
                     category: "Geography",
                     words: ["Albertville", "Athens", "Atlanta", "Barcelona", "Calgary", "Grenoble", "Innsbruck", "Lake Placid", "Lillehammer", "Los Angeles", "Melbourne", "Mexico City", "Montreal", "Moscow", "Munich", "Nagano", "Rome", "Salt Lake City", "Sapporo", "Sarajevo", "Seoul", "Squaw Valley", "Sydney", "Tokyo", "Turin"]
                    })
    puzzles.push({ name: "Prefectures of Japan",
                     category: "Geography",
                     words: ["Aichi", "Akita", "Aomori", "Chiba", "Fukui", "Fukuoka", "Fukushima", "Gifu", "Gunma", "Hiroshima", "Hokkaido", "Hyogo", "Ibaraki", "Ishikawa", "Kagawa", "Kagoshima", "Kanagawa", "Kochi", "Kumamoto", "Kyoto", "Mie", "Miyagi", "Miyazaki", "Nagano", "Nagasaki", "Nara", "Niigata", "Oita", "Okayama", "Okinawa", "Osaka", "Saga", "Saitama", "Shiga", "Shimane", "Shizuoka", "Tochigi", "Tokushima", "Tokyo", "Tottori", "Toyama", "Wakayama", "Yamagata", "Yamaguchi", "Yamanashi", "ehime"]
                    })
    puzzles.push({ name: "Rivers of Australia",
                     category: "Geography",
                     words: ["Crookwell", "Cudgegong", "Culgoa", "Daintree", "Dale", "Daly", "Dandalup", "Darling", "Dawson", "De Grey", "Dee", "Deep", "Delatite", "Delegate", "Denmark", "Derwent", "Deua", "Diamantina", "Don", "Douglas", "Dry", "Dumaresq", "Palmer", "Paroo", "Parramatta", "Peel", "Pennefather", "Pieman", "Pimpana", "Pine", "Pioneer", "Pipers", "Plenty", "Port", "Queanbeyan", "Queen", "Quidong", "Richmond", "Roper", "Ross", "Rubicon", "Russell", "Wakefield", "Walpole", "Walsh", "Ward", "Warrego", "Waukivory", "Waychinicup", "Werribee", "Wildman", "Wilson", "Wimmera", "Wingecarribee", "Wolgan", "Wollomombi", "Wollondilly", "Woronora"]
                    })
    puzzles.push({ name: "Rivers of Bulgaria",
                     category: "Geography",
                     words: ["Archar", "Arda", "Batova Reka", "Bistritsa", "Bunayska", "Cherni Iskar", "Danube", "Deleynska Reka", "Dospat", "Dzhulyunitsa", "Erma", "Fakiyska Reka", "Iskar", "Kamchiya", "Kriva", "Krumovitsa", "Lebnitsa", "Lom", "Maritsa", "Matevir", "Mesta", "Ogosta", "Osam", "Palakariya", "Rilska reka", "Ropotamo", "Rositsa", "Rusenski Lom", "Sazliyka", "Struma", "Strumeshnitsa", "Stryama", "Tsibritsa", "Tundzha", "Vacha", "Varbitsa", "Veleka", "Vit", "Voynishka Reka ", "Yantra"]
                    })
    puzzles.push({ name: "Rivers of Pakistan",
                     category: "Geography",
                     words: ["Chang Chen Mo River", "Chapursan River", "Galwan River", "Ghizar River", "Gujerab River", "Hispar River", "Hunza River", "Ishkuman River", "Khunjerab River", "Kunhar", "Liddar", "Misgar River", "Neelum", "Nubra River", "Pohru River", "Poonch River", "Saltoro River", "Sandran River", "Shimshal River", "Sind Stream", "The Kundar River", "The Zhob River", "Vishau River", "Yasin River"]
                    })
    puzzles.push({ name: "Rivers of Wisconsin",
                     category: "Geography",
                     words: ["Des Plaines River", "Devils River", "Eagle River", "East River", "East Twin River", "Eau Galle River", "Eau Pleine River", "Elk River", "Embarrass River", "Flag River", "Flambeau River", "Galena River", "Grand River", "Grant River", "Hay River", "Jump River", "Kakagon River", "Kewaunee River", "Kickapoo River", "Kohlsville River", "La Crosse River", "Lemonweir River", "Little Elk River", "Little Grant River", "Menomonee River", "Middle River", "Milwaukee River", "Mink River", "Mississippi River", "Mondeaux River", "Montello River", "Montreal River", "Mukwonago River", "Mullet River", "Namekagon River", "Nemadji River", "Neshota River", "New Wood River", "Oconomowoc River", "Oconto River", "Ounce River", "Pecatonica River", "Spruce River", "Straight River", "Suamico River", "Sugar River", "Sweeny Pond", "Teal River", "Thornapple River", "Tomahawk River", "Tomorrow River", "Totagatic River", "Trade River", "Trappe River", "Trempealeau River", "Trimbelle River", "Trout River", "Turtle River", "Upper Tamarack River", "Vermilion River", "Waupaca River", "West Twin River"]
                    })
    puzzles.push({ name: "Rocky Mountain Ski Resorts",
                     category: "Geography",
                     words: ["Alta", "Angel Fire", "Aspen Mountain", "Bear Paw", "Beaver Creek", "Big Horn", "Big Sky", "Brighton", "Cottonwood Butte", "Discovery", "Howelsen Ski Area", "Kelly Canyon", "Lookout Pass", "Pebble Creek", "Showdown", "Silverton Mountain", "Ski Cooper", "Ski Santa Fe", "Snowbasin", "Sunrise Park", "Telluride Ski Resort", "Teton Pass", "Turner Mountain", "Vail Ski Resort", "Yellowstone Club"]
                    })
    puzzles.push({ name: "San Diego Neighborhoods",
                     category: "Geography",
                     words: ["Balboa Park", "Carlsbad", "City Heights", "Coronado", "Del Mar", "Golden Hill", "Harbor Island", "Hillcrest", "Kensington", "La Costa", "La Jolla", "La Mesa", "Little Italy", "Mission Bay", "Mission Hills", "Mission Valley", "Normal Heights", "North Park", "Ocean Beach", "Old Town", "Pacific Beach", "Point Loma", "Shelter Island", "Solana Beach", "University Heights"]
                    })
    puzzles.push({ name: "San Francisco Neighborhoods",
                     category: "Geography",
                     words: ["Alamo Square", "Bernal Heights", "Cathedral Hill", "Chinatown", "Embarcadero", "Fillmore", "Golden Gate Park", "Haight-Ashbury", "Japantown", "Little Saigon", "Marina District", "Mission District", "Nob Hill", "North Beach", "Pacific Heights", "Portola", "Presidio", "Richmond District", "Saint Francis Wood", "Sunset District", "Telegraph HIll", "The Castro", "Union Square"]
                    })
    puzzles.push({ name: "Scotland Cities",
                     category: "Geography",
                     words: ["Aberdeen", "Aberfoyle", "Ayr", "Barrhead", "Bathgate", "Bellshill", "Buckhaven", "Coatbridge", "Dumbarton", "Dundee", "Edinburgh", "Erskine", "Falkirk", "Glasgow", "Hamilton", "Inverness", "Kilmarnock", "Lanark", "Livingston", "Motherwell", "Paisley", "Perth", "Renfrew", "Rutherglen", "Stirling"]
                    })
    puzzles.push({ name: "South American Countries And Capitals",
                     category: "Geography",
                     words: ["Argentina", "Asuncion", "Bogota", "Bolivia", "Brasilia", "Brazil", "Buenos Aires", "Caracas", "Cayenne", "Chile", "Columbia", "Ecuador", "French Guiana", "Georgetown", "Guyana", "Islas Malvinas", "Lima", "Montevideo", "Paraguay", "Paramaribo", "Peru", "Quito", "Santiago", "Stanley", "Sucre", "Suriname", "Uruguay", "Venezuela"]
                    })
    puzzles.push({ name: "Southern California Cities",
                     category: "Geography",
                     words: ["Agoura Hills", "Anaheim", "Barstow", "Beverly Hills", "Brea", "Burbank", "Catalina", "Costa Mesa", "Glendale", "Huntington Beach", "Joshua Tree", "Laguna Beach", "Long Beach", "Los Angeles", "Mission Viejo", "Newport Beach", "Palm Desert", "Palm Springs", "Pasadena", "Riverside", "Santa Ana", "Santa Monica", "Thousand Oaks", "Ventura", "West Hollywood"]
                    })
    puzzles.push({ name: "State Birds",
                     category: "Geography",
                     words: ["Arizona - Cactus Wren", "Connecticut - Robin", "Florida - Mockingbird", "Hawaii - Nene", "Illinois - Cardinal", "Maine - Chickadee", "Missouri - Bluebird", "Ohio - Cardinal"]
                    })
    puzzles.push({ name: "States",
                     category: "Geography",
                     words: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
                    })
    puzzles.push({ name: "States Abbreviations",
                     category: "Geography",
                     words: ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]
                    })
    puzzles.push({ name: "States Capitals",
                     category: "Geography",
                     words: ["Albany", "Annapolis", "Atlanta", "Augusta", "Austin", "Baton Rouge", "Bismarck", "Boise", "Boston", "Carson City", "Charleston", "Cheyenne", "Columbia", "Columbus", "Concord", "Denver", "Des Moines", "Dover", "Frankfort", "Harrisburg", "Hartford", "Helena", "Honolulu", "Indianapolis", "Jackson", "Jefferson City", "Juneau", "Lansing", "Lincoln", "Little Rock", "Madison", "Montgomery", "Montpelier", "Nashville", "Oklahoma City", "Olympia", "Phoenix", "Pierre", "Providence", "Raleigh", "Richmond", "Sacramento", "Salem", "Salt Lake City", "Santa Fe", "Springfield", "Tallahassee", "Topeka", "Trenton"]
                    })
    puzzles.push({ name: "Tallest Buildings in the World",
                     category: "Geography",
                     words: ["Bank of America Plaza", "Cheung Kong Centre", "Citigroup Center", "Columbia Center", "Comcast Center", "Emirates Crown", "Eureka Tower", "Key Tower", "Millennium Tower", "One Liberty Place", "Renaissance Tower", "Republic Plaza", "SEG Plaza", "Scotia Plaza", "The Trump Building", "UOB Plaza One", "Williams Tower"]
                    })
    puzzles.push({ name: "The Caribbean",
                     category: "Geography",
                     words: ["Anguilla", "Bahamas", "Bay Islands", "Bimini", "Cozumel", "Curacao", "Dominica", "Dominican Republic", "Eleuthera", "Haiti", "Jamaica", "Kokomo", "Martinique", "Nevis", "Puerto Rico", "Saba", "Saint Kitts", "Saint Lucia", "Saint Thomas", "Tobago", "Tortola", "Tortuga", "Trinidad", "Virgin Gorda", "Virgin Islands"]
                    })
    puzzles.push({ name: "U.S. Canyons",
                     category: "Geography",
                     words: ["Antelope", "Black", "Bronson", "Bryce", "Chaco", "Death", "Eaton", "Eldorado", "Glen", "Grand", "Horseshoe", "Kings", "Little River", "Logan", "Milkweed", "Nine Mile", "Paintbrush", "Red Rock", "Red Wall", "Ruby", "Seminole", "Sinks", "Snow", "Walnut", "Zion"]
                    })
    puzzles.push({ name: "UK Cities",
                     category: "Geography",
                     words: ["Aberdeen", "Bath", "Belfast", "Brighton", "Cambridge", "Cardiff", "Chester", "Edinburgh", "Glasgow", "Gloucester", "Hastings", "Leeds", "Lincoln", "London", "Manchester", "Newport", "Norwich", "Nottingham", "Oldham", "Oxford", "Plymouth", "Reading", "Southamptom", "Worthing", "York"]
                    })
    puzzles.push({ name: "US Landmarks",
                     category: "Geography",
                     words: ["Alcatraz", "Brooklyn Bridge", "Carnegie Hall", "Chrysler Building", "Fenway Park", "Gateway Arch", "Golden Gate Bridge", "Hotel Del Coronado", "Jefferson Memorial", "Lincoln Memorial", "Mount Rushmore", "Rockefeller Center", "Sears Tower", "Seattle Space Needle", "Statue of Liberty", "The White House", "USS Arizona Memorial", "Union Station", "Waldorf Astoria", "Washington Monument", "Wrigley Field"]
                    })
    puzzles.push({ name: "US National Parks",
                     category: "Geography",
                     words: ["Acadia", "Arches", "Badlands", "Big Bend", "Bryce Canyon", "Carlsbad Caverns", "Crater Lake", "Death Valley", "Everglades", "Glacier", "Glacier Bay", "Grand Canyon", "Grand Teton", "Joshua Tree", "Kings Canyon", "Mammoth Cave", "Mount Rainier", "Olympic", "Redwood", "Rocky Mountain", "Sequoia", "Shenandoah", "Yellowstone", "Yosemite", "Zion"]
                    })
    puzzles.push({ name: "Virginia Cities",
                     category: "Geography",
                     words: ["Alexandria", "Bedford", "Bristol", "Buena Vista", "Charlottesville", "Chesapeake", "Colonial Heights", "Covington", "Danville", "Fairfax", "Falls Church", "Hampton", "Harrisonburg", "Lexington", "Lynchburg", "Manassas", "Newport News", "Norfolk", "Petersburg", "Richmond", "Roanoke", "Salem", "Suffolk", "Virginia Beach", "Williamsburg"]
                    })
    puzzles.push({ name: "West Coast Ski Resorts",
                     category: "Geography",
                     words: ["Alpine Meadowns", "Arctic Valley", "Badger Pass", "Bear Mountain", "Bear Valley", "Boreal", "Buckhorn Ski Club", "Diamond Peak", "Dodge Ridge", "Eaglecrest", "Echo Valley", "Heavenly", "Kirkwood", "Mammoth", "Mount Bachelor", "Mount Hood Meadows", "Mount Shasta Ski Park", "Mountain High", "Sierra Summit", "Sky Tavern", "Snow Summit", "Squaw Valley", "Tahoe Donner", "Timberline"]
                    })
    puzzles.push({ name: "World Bays",
                     category: "Geography",
                     words: ["Bengal", "Biscay", "Biscayne", "Boston", "Chesapeake", "Delaware", "Donegal", "Galveston", "Galway", "Green ", "Guantanamo", "Hudson", "Lyme", "Manila", "Massachusetts", "Mobile", "Monterey", "Naples", "Narragansett", "San Diego", "San Francisco", "San Pablo", "Tampa", "Thunder"]
                    })
    puzzles.push({ name: "World Landmarks",
                     category: "Geography",
                     words: ["Angkor Wat", "Arc de Triomphe", "Arch of Constantine", "Arch of Titus", "Big Ben", "Colosseum", "Drum Tower", "Eiffel Tower", "Great Wall of China", "Leaning Tower of Pisa", "Machu Picchu", "Petra", "Pyramids of Giza", "Sistine Chapel", "Stonehenge", "Taj Mahal", "The Alhambra", "The Forbidden City", "The Great Sphinx", "The Pantheon", "The Parthenon", "The Three Great Halls", "The Vatican", "Tower of London", "Westminster Abbey"]
                    })
    puzzles.push({ name: "World Seas",
                     category: "Geography",
                     words: ["Adriatic", "Aegean", "Arabian", "Aral", "Baltic", "Black", "Caribbean", "Caspian", "Celtic", "Coral", "Crete", "Dead", "East Siberian", "Flores", "Galilee", "Ionian", "Irish", "Laptev", "Meditteranean", "North", "Philippine", "Red", "Salton", "Sargasso", "Timor"]
                    })
    puzzles.push({ name: "Worlds Largest Countries By Population",
                     category: "Geography",
                     words: ["Bangladesh", "Brazil", "China", "Egypt", "Ethiopia", "France", "Germany", "India", "Indonesia", "Iran", "Italy", "Japan", "Mexico", "Myanmar", "Nigeria", "Pakistan", "Philippines", "Russia", "South Korea", "Thailand", "Turkey", "United Kingdom", "United States", "Vietnam"]
                    })
    puzzles.push({ name: "Worlds Largest Countries By Total Area",
                     category: "Geography",
                     words: ["Algeria", "Angola", "Argentina", "Australia", "Brazil", "Canada", "Chad", "China", "Columbia", "India", "Indonesia", "Iran", "Kazakhstan", "Libya", "Mali", "Mexico", "Mongolia", "Niger", "Peru", "Russia", "Saudi Arabia", "South Africa", "Sudan", "United States"]
                    })
    puzzles.push({ name: "Worlds Most Populous Cities",
                     category: "Geography",
                     words: ["Bangkok", "Beijing", "Bogota", "Cairo", "Delhi", "Dhaka", "Hong Kong", "Istanbul", "Jakarta", "Karachi", "Lagos", "Lahore", "Lima", "Mexico City", "Moscow", "Mumbai", "Sao Paulo", "Seoul", "Shanghai", "Tehran", "Tokyo"]
                    })
    puzzles.push({ name: "Almonds",
                     category: "Foods",
                     words: ["Bitter", "Bitter Kernel", "Butte", "California", "Carmel", "Fritz", "Golden State", "Golden State Kernel", "Hard-shelled", "IXL Kernel", "Jordan ", "Jordan Kernel", "La Prima", "La Prima Kernel", "Languedoc", "Languedoc Kernel", "Mission", "Monterey", "Nonpareil", "Padre", "Paper-shelled", "Peerless", "Price", "Soft", "Sonora"]
                    })
    puzzles.push({ name: "Bakeware",
                     category: "Foods",
                     words: ["baking cups", "bundt pan", "cake molds", "cake pan", "cake stand", "cookie cutter", "cookie press", "cookie scoop", "cookie sheet", "cooling rack", "flour sifter", "food coloring", "jelly-roll pan", "loaf pan", "measuring cups", "measuring spoons", "mixing bowl", "mixing spoon", "muffin tin", "pastry bag", "pastry cutter", "pie pan", "sheet cake pan", "springform", "tart pan"]
                    })
    puzzles.push({ name: "Beef Entrees",
                     category: "Foods",
                     words: ["braised", "brisket", "broiled", "chili", "corned beef", "curry", "fajitas", "fried", "grilled", "kabobs", "meatballs", "meatloaf", "pepper steak", "pot pie", "ribs", "roast", "seared", "sloppy joes", "stew", "stir fry", "stroganoff", "tacos", "taquitos", "teriyaki"]
                    })
    puzzles.push({ name: "Breakfast Cereals",
                     category: "Foods",
                     words: ["Apple Jacks", "Banana Nut Crunch", "Bran Flakes", "Cheerios", "Chex", "Cocoa Puffs", "Corn Flakes", "Corn Pops", "Cream of Wheat", "Crispix", "Fiber One", "Frosted Flakes", "Golden Grahams", "Life", "Malt-O-Meal", "Mueslix", "Puffins", "Quaker Oats", "Raisin Bran", "Rice Krispies", "Shredded Wheat", "Trix", "Weetabix", "Wheaties"]
                    })
    puzzles.push({ name: "Breakfast Foods",
                     category: "Foods",
                     words: ["bacon", "bagel", "biscuit", "cereal", "coffee", "croissant", "danish", "eggs", "english muffin", "french toast", "granola", "grits", "hash browns", "milk", "muesli", "muffin", "oatmeal", "orange juice", "pancake", "sausage", "scone", "tea", "toast", "waffle", "yogurt"]
                    })
    puzzles.push({ name: "Cheeses",
                     category: "Foods",
                     words: ["acorn", "american", "asadero", "asiago", "blue", "brie", "cheddar", "colby", "cottage", "cream", "edam", "feta", "gorgonzola", "gouda", "jack", "mascarpone", "molbo", "mozzarella", "muenster", "panela", "parmesan", "provolone", "ricotta", "romano", "swiss"]
                    })
    puzzles.push({ name: "Chicken Entrees",
                     category: "Foods",
                     words: ["baked", "barbecued", "cacciatore", "chow mein", "coq au vin", "cordon bleu", "croquette", "curry", "dijon", "divan", "dumpling", "enchiladas", "fajitas", "florentine", "fried", "fritter", "grilled", "gumbo", "kung pao", "lemon", "marsala", "parmigiana", "roast", "teriyaki", "wings"]
                    })
    puzzles.push({ name: "Chocolate",
                     category: "Foods",
                     words: ["antioxidant", "bain-marie", "bitter", "bittersweet", "bloom", "bonbon", "bouchon", "brownies", "cacao", "cocoa", "cocoa butter", "dark ", "dutch", "flavanol", "ganache", "milk ", "nib", "pastille", "pugging", "semisweet", "swiss", "truffle", "unsweetened", "white"]
                    })
    puzzles.push({ name: "Condiments",
                     category: "Foods",
                     words: ["black olives", "black pepper", "brown mustard", "chile pepper", "chilies", "chutney", "cooking sherry", "curry", "gravy", "green olives", "horseradish", "kalamata olives", "ketchup", "mayonnaise", "mushrooms", "pepperoncinis", "pickles", "pimentos", "relish", "roasted peppers", "salt", "shredded cheese", "sour cream", "vinegar", "wasabi"]
                    })
    puzzles.push({ name: "Cooking Oils",
                     category: "Foods",
                     words: ["almond", "avocado", "butter", "canola", "coconut", "corn", "cottonseed", "extra virgin olive", "flaxseed", "grapeseed", "hazelnut", "lard", "palm", "peanut", "pine nut", "pumpkin seed", "pure olive", "rice bran", "safflower", "sesame", "shortening", "soybean", "sunflower", "vegetable", "walnut"]
                    })
    puzzles.push({ name: "Cookware and Utensils",
                     category: "Foods",
                     words: ["basting brush", "braiser", "butcher block", "chafing dish", "cheese grater", "colander", "crock pot", "cutting board", "deep fryer", "double boiler", "dutch oven", "egg slicer", "frying pan", "garlic press", "griddle", "potato masher", "quiche dish", "roasting rack", "sieve", "slotted spoon", "spatula", "steamer insert", "turkey baster", "vegetable peeler", "wok"]
                    })
    puzzles.push({ name: "Culinary Spices",
                     category: "Foods",
                     words: ["Mexican pepperleaf", "allspice", "anise", "cayenne pepper", "celery seed", "chipotle", "cinnamon", "cloves", "cumin", "dorrigo pepper", "elderflower", "fenugreek", "ginger", "jasmine", "juniper berry", "lemon verbena", "nutmeg", "paprika", "pepper", "peppercorn", "poppy seed", "saffron", "sassafras", "turmeric", "vanilla"]
                    })
    puzzles.push({ name: "Deli Meats",
                     category: "Foods",
                     words: ["Canadian bacon", "Italian sausage", "Virginia baked ham", "barbecue beef", "black forest ham", "bologna", "bratwurst", "capicola", "corned beef", "honey ham", "kielbasa", "liver pate", "liverwurst", "mortadella", "olive loaf", "pastrami", "pepperoni", "prosciutto", "roast beef", "salami", "smoked sausage", "smoked turkey", "summer sausage", "turkey", "turkey ham"]
                    })
    puzzles.push({ name: "Diet Food Delivery Services",
                     category: "Foods",
                     words: ["Bistro MD", "Diet Across America", "Diet Designs", "Diet Gourmet", "Diet at Your Doorstep", "Diet-to-Go", "DineWise", "Eat Like The Pros", "Fresh Diet", "Freshology", "Frozen Fitness", "Healthy Connections", "In the Zone Delivery", "Kosher Diet Delivery", "LeViv", "Magic Kitchen", "Nutrition in Motion", "Our Life Fresh", "Sunfare", "eDiets Meal Delivery"]
                    })
    puzzles.push({ name: "Frozen Food Companies",
                     category: "Foods",
                     words: ["Bagel Bites", "Birdseye", "Boca", "Butterball", "Digiorno", "Don Miguel", "Eggo", "Freschetta", "Gardenburger", "Healthy Choice", "Hot Pockets", "Hungry-Man", "Kid Cuisine", "Lean Cuisine", "Lean Pockets", "Morningstar Farms", "Ore-Ida", "Pillsbury", "Sara Lee", "Swanson", "Tombstone", "Tyson"]
                    })
    puzzles.push({ name: "Grains",
                     category: "Foods",
                     words: ["amaranth", "arborio rice", "barley", "basmati rice", "bran", "brown rice", "buckwheat", "bulgur", "couscous", "flaxseed", "hominy", "kasha", "millet", "milo", "oats", "pearl rice", "quinoa", "risotto", "rye", "saffron", "sorghum", "spelt", "tef", "wheat berries", "wild rice"]
                    })
    puzzles.push({ name: "Herbs",
                     category: "Foods",
                     words: ["anise", "basil", "bay laurel", "calendula", "caraway", "chamomile", "chives", "coriander", "dill", "fennel", "garlic", "hyssop", "lavender", "marjoram", "mustard", "oregano", "parsley", "peppermint", "rosemary", "rue", "sage", "sorrel", "tarragon", "thyme", "verbena"]
                    })
    puzzles.push({ name: "Italian Food",
                     category: "Foods",
                     words: ["bruschetta", "calamari", "calzone", "chianti", "ciabatta", "crostolo", "focaccia", "fonduta", "fontina", "frisella", "fusilli", "gnocchi", "marinara", "minestrone", "mozzarella", "orecchiette", "osso bucco", "pancetta", "pizza", "polenta", "prosciutto", "prosecco", "ravioli", "risotto", "salami"]
                    })
    puzzles.push({ name: "Kitchen Items",
                     category: "Foods",
                     words: ["blender", "butter dish", "can opener", "coffee maker", "corkscrew", "dishwasher", "foil", "freezer", "garbage disposal", "ice cream scoop", "ladle", "microwave", "mixer", "oven", "pots", "refrigerator", "rice cooker", "rolling pin", "salt shaker", "saran wrap", "sink", "skewers", "stove", "tea kettle", "toaster"]
                    })
    puzzles.push({ name: "Medicinal Spices",
                     category: "Foods",
                     words: ["ajwain", "astragalus", "bergamot orange", "catnip", "comfrey", "dill oil", "eaglewood", "echinacea", "foxglove", "goldenseal", "hawthorn", "horehound", "konjac", "licorice", "lime blossom", "mullein", "opium poppy", "passion-flower", "plantain", "pokeweed", "poppy seeds", "sweet sagewort", "valerian", "wormwood", "yarrow"]
                    })
    puzzles.push({ name: "Mexican Desserts and Sweets",
                     category: "Foods",
                     words: ["Arroz con leche", "Cajeta", "Capirotada", "Champurrado", "Chongos zamoranos", "Churros", "Coyotas", "Dulce de leche", "Empanadas", "Flan", "Glorias", "Guanajuato", "Ice cream", "Jamoncillos", "Jarritos", "Obleas", "Pan de Acambaro", "Pan de muerto", "Pan dulce", "Pepitorias", "Platano", "Rosca de reyes"]
                    })
    puzzles.push({ name: "Mexican Food",
                     category: "Foods",
                     words: ["adobo", "albondiga", "asadero", "beans", "burritos", "chalupas", "chiles", "chimichangas", "chipotle", "cilantro", "corn", "enchiladas", "fajitas", "guacamole", "manchego", "oaxaca", "quesadillas", "rice", "salsa", "tacos", "tamales", "tequila", "tomatillo", "tortillas", "tostadas"]
                    })
    puzzles.push({ name: "Olives",
                     category: "Foods",
                     words: ["Aleppo", "Alphonso", "Black", "Black Greek", "Cracked Provencal", "Gaeta", "Greek Green", "Gyeta", "Hondroelia", "Kalamata", "Kura", "Ligurian", "Lucque", "Lugano", "Manzanilla", "Marche", "Mission", "Moroccan", "Nafplion", "Nicoise", "Nyons", "Picholine", "Ponentine", "Royal", "Victoria"]
                    })
    puzzles.push({ name: "Pasta",
                     category: "Foods",
                     words: ["cannelloni", "capellini", "conchigliette", "couscous", "farfalle", "fettucini", "fusilli", "gnocchi", "lasagne", "linguine", "macaroni", "manicotti", "orecchiette", "orzo", "pansotti", "penne", "ravioli", "rigatoni", "rotelle", "rotini", "spaghetti", "tortellini", "tubetti", "vermicelli", "ziti"]
                    })
    puzzles.push({ name: "Pizza Toppings",
                     category: "Foods",
                     words: ["anchovies", "basil", "capers", "chicken", "dill", "eggplant", "garlic", "ham", "leeks", "mushrooms", "olives", "onions", "oregano", "parsley", "pepperoni", "peppers", "pine nuts", "pineapple", "prosciutto", "rosemary", "salami", "salmon", "sausage", "sprouts", "tomatoes"]
                    })
    puzzles.push({ name: "Salad Fixings",
                     category: "Foods",
                     words: ["artichoke hearts", "bacon ", "beets", "bell peppers", "carrots", "celery", "cheese", "chick peas", "corn", "croutons", "cucumbers", "eggs", "endive", "kidney beans", "mushrooms", "olives", "onions", "pepperoncinis", "pickles", "pumpkin seeds", "radishes", "radishes", "red cabbage", "sprouts", "sunflower seeds"]
                    })
    puzzles.push({ name: "Sauces",
                     category: "Foods",
                     words: ["alfredo", "barbecue", "bernaise", "buffalo wing", "carbonara", "cheese", "chinese plum", "chipotle", "cocktail", "fondue", "hoisin", "hollandaise", "horseradish", "oyster", "peppercorn", "pizza", "soy", "spaghetti", "steak", "sweet and sour", "szechaun", "tabasco", "taco", "tartar", "teriyaki"]
                    })
    puzzles.push({ name: "Seeds and Nuts",
                     category: "Foods",
                     words: ["almonds", "brazil nuts", "buckeye nut", "cashews", "chestnut", "coriander seed", "cotton seed", "cumin seed", "dill seed", "fennel seed", "flaxseed", "hazelnuts", "macadamia nuts", "mustard seed", "peanuts", "pecans", "pine nuts", "pistachios", "poppy seed", "pumpkin seeds", "sesame seeds", "soy nuts", "squash seeds", "sunflower seeds", "walnuts"]
                    })
    puzzles.push({ name: "Summer BBQ Foods",
                     category: "Foods",
                     words: ["baked beans", "bbq chicken", "bbq wings", "chips", "chocolate cake", "cole slaw", "corn on the cob", "deviled eggs", "dip", "hamburgers", "hot dogs", "iced tea", "kabobs", "lemonade", "macaroni salad", "onion rings", "potato salad", "sangria", "shrimp cocktail", "sliders", "strawberries", "succotash", "summer squash", "tomatoes", "zucchini"]
                    })
    puzzles.push({ name: "Summer Vegetables",
                     category: "Foods",
                     words: ["Candy Stripe beets", "Porcini mushrooms", "arugula", "avocados", "basil ", "bell peppers", "collards", "cucumber", "eggplant", "green beans", "green okra", "kohlrabi", "onions", "oregano", "potatoes", "red beets", "red okra", "shallots", "sugar snap peas", "tomatoes", "white beets", "white corn", "yellow beets", "yellow squash", "zucchini"]
                    })
    puzzles.push({ name: "Sushi",
                     category: "Foods",
                     words: ["Age", "Ameaebi", "Boston Rolls", "California Roll", "Ebi", "Egg Salad Rolls", "Hamachi", "Hirame", "Hotate", "Ika", "Ikura", "Kani", "Kappa Maki", "Maguro", "Masago", "Mirugai", "New York Rolls", "Pesto Rolls", "Saba", "Sake", "Tai", "Tako", "Tekka Maki", "Unagi", "Uni"]
                    })
    puzzles.push({ name: "Types Of Apples",
                     category: "Foods",
                     words: ["Arkansas Black", "Braeburn", "Cameo", "Cortland", "Crispin", "Empire", "Fuji", "Gala", "Ginger Gold", "Golden Delicious", "Granny Smith", "Gravenstein", "Honeycrisp", "Ida Red", "Jonagold", "Jonathan", "McIntosh", "Northern Spy", "Paula Red", "Pink Lady", "Red Delicious", "Rome", "Spartan", "Winesap", "York"]
                    })
    puzzles.push({ name: "Types Of Bread",
                     category: "Foods",
                     words: ["bagel", "baguette", "barley", "chapati", "egg", "flat", "focaccia", "french", "hearth", "kamut", "manna", "matzo", "millet", "naan", "oat", "pita", "potato", "rice", "rye", "sourdough", "spelt", "sprouted grain", "triticale", "wheat", "white"]
                    })
    puzzles.push({ name: "Types Of Coffee",
                     category: "Foods",
                     words: ["Alajuela", "Altura", "Americano", "Arabica", "Arusha", "Bani", "Barahona", "Bugishu", "Caracas", "Chiapas", "Cibao", "Columbia", "Cucata", "Dijmah", "Ghimbi", "Harrar", "Heredia", "Jinotegoa", "Kalossi", "Limu", "Matari", "Merida", "Ocoa", "Santos", "Zambia"]
                    })
    puzzles.push({ name: "Types Of Grapes",
                     category: "Foods",
                     words: ["Alden", "Alwood", "Aurore", "Barry", "Beauty Seedless", "Cascade", "Delaware", "Delight", "Diamond", "Dobson", "Edelweiss", "Erie", "Esprit", "Glenora", "Iona", "Lindley", "Munson", "Perlette", "Red Flame", "Royal Blue", "Ruby", "Seneca", "Swensen White", "Thompson"]
                    })
    puzzles.push({ name: "Types Of Tea",
                     category: "Foods",
                     words: ["Bancha", "Chai", "Chamomile", "Darjeeling", "Dragon Well Green", "Earl Grey", "English Breakfast", "Flowery Orange Pekoe", "Genmaicha", "Irish Breakfast", "Jasmine", "Kukicha", "Matcha", "Orange Blossom", "Peppermint", "Pu-erh", "Rooibos", "Satsuma", "Silver Needle White", "Star of China", "black", "green", "oolong", "white"]
                    })
    puzzles.push({ name: "Types of Beans",
                     category: "Foods",
                     words: ["Anasazi", "Asparagus", "Azuki", "Black Turtle", "Black-eyed peas", "Broad", "Cannellini", "Fava", "French haricot", "Garbanzo", "Green", "Kidney", "Lentils", "Lima", "Mung", "Navy", "Pinto", "Runner", "Scarlet Runner", "Snake", "Soybeans", "Split Peas", "String", "Wax", "Yardlong"]
                    })
    puzzles.push({ name: "Types of Chile Peppers",
                     category: "Foods",
                     words: ["Anaheim", "Ancho", "Cayenne", "Cherry", "Chipotle", "Coronado", "Dorset Naga", "Espanola", "Jalapeno", "Manzano", "Mirasol", "Mulato", "Pasilla", "Pepperoncini", "Pimento", "Poblano", "Pulla", "Red Amazon", "Rocotillo", "Sandia", "Serrano", "Sonora", "Sweet Banana", "Sweet Bell", "Tabasco"]
                    })
    puzzles.push({ name: "Types of Tomatoes",
                     category: "Foods",
                     words: ["Anna Russian", "Aurora", "Banana Legs", "Bingo", "Caspian Pink", "Ceylon", "Champion", "Cobra", "Delicious", "Duke", "Dutchman", "Garden Peach", "German Johnson", "Giant Belgium", "Hank", "Heidi", "Heinz", "Jubilee", "Juliet", "Nepal", "Old Virginia", "Purple Calabash", "Red Pear", "Rocky", "Spoon"]
                    })
    puzzles.push({ name: "Types of Wine",
                     category: "Foods",
                     words: ["Asti", "Bordeaux", "Chablis", "Champagne", "Chardonnay", "Chianti", "Claret", "Cuvee", "Fume Blanc", "Grenache", "Merlot", "Muscat", "Orvieto", "Petite Syrah", "Pinor Grigio", "Pinot Noir", "Port", "Riesling", "Rose", "Sangiovese", "Sauvignon Blanc", "Sherry", "Shiraz", "Tokay", "Zinfandel"]
                    })
    puzzles.push({ name: "Veggies",
                     category: "Foods",
                     words: ["Artichoke", "Asparagus", "Beet", "Bell Pepper", "Broccoli", "Brussels Sprouts", "Cabbage", "Carrots", "Cauliflower", "Celery", "Corn", "Cucumber", "Eggplant", "Lettuce", "Okra", "Onion", "Peas", "Potato", "Pumpkin", "Radish", "Spinach", "Squash", "String Bean", "Turnip", "Zucchini"]
                    })
    puzzles.push({ name: "Walnuts",
                     category: "Foods",
                     words: ["Amigo", "Ashley", "Baum", "Chico", "Cisco", "Daniels", "Drummond", "Earhorn", "El Monte", "French", "Grove", "Gustine", "Hartley", "Idaho English", "Jensen", "Lenal", "Lompoc", "Milan", "Nuggett", "Pedro", "Poe", "Serr", "Sierra Gold", "Tulare", "Vina"]
                    })
    puzzles.push({ name: "Ancient Cities",
                     category: "History",
                     words: ["Alexandria", "Angkor", "Antioch", "Ashdod", "Assur", "Athens", "Babylon", "Baghdad", "Bukhara", "Caesarea", "Carthage", "Corinth", "Damascus", "Delphi", "Ephesus", "Gath", "Jericho", "Jerusalem", "Rome", "Samaria", "Sparta", "Susa", "Tarsus", "Troy", "Ur"]
                    })
    puzzles.push({ name: "Ancient Civilizations",
                     category: "History",
                     words: ["Amorites", "Assyrians", "Aztecs", "Babylonians", "Corinthians", "Egyptians", "Franks", "Hittites", "Huns", "Incas", "Israelites", "Ithacans", "Judeans", "Macedonians", "Mayans", "Mongols", "Nubians", "Persians", "Philistines", "Phoenicians", "Romans", "Saxons", "Spartans", "Trojans", "Vikings"]
                    })
    puzzles.push({ name: "Ancient Middle East",
                     category: "History",
                     words: ["Assyrians", "Babylon", "Black Land", "Code of Hammurabi", "Cyrus the Great", "Darius the Great", "Enki", "Euphrates", "Fertile Crescent", "Giza", "Hammurabi", "Hatshepsut", "Hyksos", "Khafu", "King Tut", "Menes", "Mesopotamia", "Phoenicians", "Sargon", "Solomon", "Sumer", "Tigris", "pharaoh", "pyramid", "ziggurat"]
                    })
    puzzles.push({ name: "Battles Of World War I",
                     category: "History",
                     words: ["Aisne", "Albert", "Arras", "Artois", "Cambrai", "Canal du Nord", "Caporetto", "Galliopi Campaign", "Gaza", "Gorizia", "Heligoland", "Isonzo", "Jutland", "Le Hamel", "Marne", "Messines", "Mons", "Nueve Chapelle", "Passchendaele", "Somme", "Tannenberg", "Verdun", "Vittorio Veneto", "Ypres"]
                    })
    puzzles.push({ name: "Battles Of World War II",
                     category: "History",
                     words: ["Ardennes", "Arnhem", "Balkans", "Berlin", "Berlin", "Britain", "Bulge", "Crimea", "Denmark", "El Alamein", "Guadalcanal", "Guam", "Iwo Jima", "Kursk", "Kwajalein", "Leningrad", "Midway", "Normandy", "Okinawa", "Pearl Harbor", "Sevastopol", "Sidi Barrani", "Stalingrad", "Warsaw"]
                    })
    puzzles.push({ name: "Bermuda Triangle",
                     category: "History",
                     words: ["Deep See", "Iron Birds", "Anita", "Bermuda", "Connemara IV", "Ellen Austin", "Martin Mariner", "Miami", "Puerto Rico", "SS Sandra", "San Juan", "Scorpion", "Star Ariel", "Star Tiger", "The Avengers", "The Gulf Stream", "Tudor IV", "USS Cyclops", "compass variation"]
                    })
    puzzles.push({ name: "California Gold Rush",
                     category: "History",
                     words: ["Cousin Jack", "Welcome Stranger", "alluvial gold", "claim", "claim jumping", "color", "coyoting", "diggings", "long tom", "mother lode", "panning", "pay dirt", "placer", "placer mining", "pocket", "poke", "prospector", "riffles", "slickins", "tailing dump", "tailings", "tailrace"]
                    })
    puzzles.push({ name: "Civil Rights Movement",
                     category: "History",
                     words: ["Black Panthers", "Bloody Sunday", "Greensboro sit-ins", "Jackie Robinson", "James Meredith", "Jim Crow laws", "Little Rock Nine", "Malcolm X", "Medgar Evers", "NAACP", "Rosa Parks", "Thurgood Marshall", "Watts riots", "desegregation", "discrimination", "freedom riders", "segregation", "separate but equal"]
                    })
    puzzles.push({ name: "Civil War",
                     category: "History",
                     words: ["Abraham Lincoln", "Antietam", "Appomattox", "Charles Hopkins", "Chattanooga", "Chickamauga", "Clara Barton", "Confederate", "Copperheads", "Gettysburg", "Ironclad Oath", "Jefferson Davis", "Manassas", "North", "Philip Kearny", "Philip Kearny", "South", "The Seven Days Battle", "Union"]
                    })
    puzzles.push({ name: "Civil War Battles",
                     category: "History",
                     words: ["Antietam", "Appomattox Station", "Atlanta", "Bentonville", "Bull Run", "Burdens Causeway", "Chattanooga", "Chickamauga", "Corinth", "Fort Sumter", "Fredericksburg", "Gettysburg", "Manassas", "Mine Creek", "Nashville", "New Orleans", "Pea Ridge", "Petersburg", "Picketts Mill", "Roanoke Island", "Secessionville", "Shiloh", "Stones River", "Vicksburg"]
                    })
    puzzles.push({ name: "Colonial Williamsburg Occupations",
                     category: "History",
                     words: ["apothecary", "basket maker", "blacksmith", "bookbinder", "brick maker", "cabinetmaker", "carpenter", "cooper", "cutler", "dressmaker", "founder", "goldsmith", "gunsmith", "hatter", "milliner", "printer", "rope maker", "saddler", "shoemaker", "silversmith", "tailor", "tavern keeper", "weaver", "wheelwright", "wigmaker"]
                    })
    puzzles.push({ name: "Emperors of Japan",
                     category: "History",
                     words: ["Emperor Ankan", "Emperor Annei", "Emperor Bidatsu", "Emperor Buretsu", "Emperor Hanzei", "Emperor Itoku", "Emperor Kaika", "Emperor Keitai", "Emperor Kimmei", "Emperor Ninken", "Emperor Nintoku", "Emperor Seimu", "Emperor Seinei", "Emperor Senka", "Emperor Suizei", "Emperor Sujin"]
                    })
    puzzles.push({ name: "English Monarchs",
                     category: "History",
                     words: ["Athelstan ", "Edgar Atheling ", "Edgar the Peaceable ", "Edmund I ", "Edred ", "Edward I ", "Edward II ", "Edward III ", "Edward IV ", "Edward V ", "Edward VI ", "Edwy the Fair ", "Elizabeth I", "Empress Matilda ", "Ethelred the Unready ", "Harold Godwinson ", "Harold Harefoot ", "Henry I ", "Henry II ", "Henry III ", "Henry IV ", "Henry V ", "Henry VI ", "Henry VII ", "Henry VIII ", "Jane ", "Mary I ", "Richard II ", "Richard III ", "St Edward the Martyr ", "Stephen ", "William II "]
                    })
    puzzles.push({ name: "Famous American Indians",
                     category: "History",
                     words: ["Billy Bowlegs", "Billy Mills", "Black Hawk", "Captain Jack", "Cochise", "Crazy Horse", "Gall", "Geronimo", "Hiawatha", "Ishi", "Joseph", "Joseph Brant", "Lone Wolf", "Pocahontas", "Pontiac", "Powhatan", "Red Cloud", "Red Jacket", "Sacajawea", "Samoset", "Sequoyah", "Sitting Bull", "Tecumseh", "Wilma Mankiller"]
                    })
    puzzles.push({ name: "Famous American Speeches",
                     category: "History",
                     words: ["A Time for Choosing", "A Whisper of AIDS", "Atoms for Peace", "Checkers", "First Fireside Chat", "I Have A Dream", "Ich bin ein Berliner", "The Fourteen Points", "The Great Society", "We Shall Overcome"]
                    })
    puzzles.push({ name: "Famous Castles",
                     category: "History",
                     words: ["Akita", "Blarney", "Castel del Monte", "Castillo de Coca", "Chateau Gaillard", "Edinburgh", "Falkenstein", "Foix", "Hikone", "Himeji", "Inayama", "Kremlin", "Kumamoto", "Matsumoto", "Neuschwanstein", "Nosferatu", "Penafiel", "San Gimignano", "Shuri", "The Tower of London", "Urquhart", "Versailles", "Vincennes", "Wartburg", "Windsor"]
                    })
    puzzles.push({ name: "Famous Rulers",
                     category: "History",
                     words: ["Alexander the Great", "Attila the Hun", "Catherine the Great", "Charlemagne", "Charles Martel", "Claudius", "Cleopatra", "Constantine", "Darius the Great", "Elizabeth I", "Frederick the Great", "Hammurabi", "Henry VIII", "Ivan the Terrible", "King David", "Louis XIV", "Marie Antoinette", "Montezuma", "Napoleon", "Nefertiti", "Nero", "Odysseus", "Robert the Bruce", "Solomon", "Xerxes"]
                    })
    puzzles.push({ name: "Famous Ships",
                     category: "History",
                     words: ["Amistad", "Argo", "Arizona", "Bismarck", "Bounty", "Caine", "Constellation", "Constitution", "Cutty Sark", "Flying Cloud", "Hesperus", "Hispaniola", "Lusitania", "Maine", "Mary Celeste", "Mary Rose", "Mayflower", "Nina", "Normandie", "Pinta", "Pueblo", "Queen Mary", "Santa Maria", "Titanic", "Victory"]
                    })
    puzzles.push({ name: "Famous Women Rulers",
                     category: "History",
                     words: ["Amina", "Catherine de Medici", "Catherine the Great", "Cleopatra", "Eleanor of Aquitaine", "Elizabeth I", "Golda Meir", "Hatshepsut", "Indira Ghandi", "Isabella I of Castile", "Joan of Arc", "Liliuokalani", "Margaret Thatcher", "Mary Queen of Scots", "Mbande Nzinga", "Nefertiti", "Queen Esther", "Queen Maud", "Queen Tomyris", "Queen Victoria", "Queen of Sardinia", "Queen of Sheba", "Sammuramat", "Tzu-hsi", "Zulu Queen Nandi"]
                    })
    puzzles.push({ name: "First Ladies",
                     category: "History",
                     words: ["Abigail Adams", "Abigail Fillmore", "Anna Harrison", "Barbara Bush", "Caroline Harrison", "Claudia Johnson", "Dolley Madison", "Edith Roosevelt", "Edith Wilson", "Eliza Johnson", "Elizabeth Ford", "Elizabeth Monroe", "Elizabeth Truman", "Ellen Wilson", "Florence Harding", "Frances Cleveland", "Grace Coolidge", "Helen Taft", "Hillary Clinton", "Ida McKinley", "Jane Pierce", "Jaqueline Onassis", "Julia Grant", "Julia Tyler", "Laura Bush", "Letitia Tyler", "Lou Henry Hoover", "Louisa Adams", "Lucretia Garfield", "Lucy Hayes", "Mamie Eisenhower", "Margaret Taylor", "Martha Washington", "Mary Lincoln", "Nancy Reagan", "Patricia Nixon", "Rosalynn Carter", "Sarah Polk"]
                    })
    puzzles.push({ name: "Franklin D Roosevelt",
                     category: "History",
                     words: ["CCC", "Eleanor Roosevelt", "FDIC", "Fala", "Good Neighbor Policy", "Hyde Park", "Infamy Speech", "Map Room", "New Deal", "Pearl Harbor", "Rainbow Five", "Social Security", "TVA", "The Great Depression", "The United Nations", "Top Cottage", "WPA", "four terms", "polio", "recovery", "reform", "relief"]
                    })
    puzzles.push({ name: "Historical Pirates",
                     category: "History",
                     words: ["Barbarossa", "Benito De Soto", "Black Bart", "Blackbeard", "Calico Jack", "Charles Swan", "Dirk Chivers", "Henry Morgan", "Jan Janz", "Jean Bart", "John Fenn", "John Ward", "Jose Gaspar", "Lionel Wafer", "Mary Read", "Pedro Gilbert", "Piet Hein", "Red Legs Greaves", "Sam Lord", "Samuel Mason", "Sir John Hawkins", "Thomas Cavendish", "Tobias Bridge", "William Dampier", "William Kidd"]
                    })
    puzzles.push({ name: "Inventors",
                     category: "History",
                     words: ["Thomas Edison", "Adolf Eugen Fick", "Aleksandar Just", "Cai Lun", "Chester Carlson", "Christopher Sholes", "Eli Whitney", "George Eastman", "Gottlieb Daimler", "Hans von Ohain", "John Bardeen", "John Fitch", "Katherine Blodgett", "Konrad Zuse", "Leo Baekeland", "Lewis Urry", "Michael Faraday", "Rudolf Diesel", "Thomas Savery", "Walter Hunt", "Zacharias Janssen"]
                    })
    puzzles.push({ name: "John F Kennedy",
                     category: "History",
                     words: ["Caroline Kennedy", "Civil Rights", "Cuban Missile Crisis", "Democrat", "Harvard", "JFK University", "Jack", "Jacqueline Kennedy", "Lee Harvey Oswald", "Lieutenant", "Peace Corps", "Profiles in Courage", "Roman Catholic", "Senator", "The Bay of Pigs", "The Cold War", "Vietnam"]
                    })
    puzzles.push({ name: "Kings And Queens Of England",
                     category: "History",
                     words: ["Alfred the Great", "Anne", "Athelstan", "Canute", "Charles I", "Edgar", "Edmund I", "Edmund II", "Edred", "Edward Elder", "Elizabeth I", "Elizabeth II", "George V", "George VI", "Harold I", "Harold II", "Henry I", "Henry VIII", "Mary I", "Mary II", "Richard I", "Richard III", "Victoria", "William I", "William II"]
                    })
    puzzles.push({ name: "Korean War Battles And Operations",
                     category: "History",
                     words: ["Bloody Ridge", "Citadel", "Clam-Up", "Clean-Up", "Clean-Up II", "Cleaver", "Commando", "Counter", "Cow Puncher", "Dauntless", "Detonate", "Heartbreak Ridge", "Killer", "Nomad and Polar", "Ohio-Sloan", "Old Baldy", "Piledriver", "Polecharge", "Pork Chop Hill", "Ripper", "Rugged", "Showdown", "Thunderbolt"]
                    })
    puzzles.push({ name: "Middle Ages",
                     category: "History",
                     words: ["Charlemagne", "Ivan the Terrible", "King Arthur", "Selijuks", "The Norman Conquest", "Vikings", "armor", "arrow", "bishops", "castles", "crossbow", "crusade", "feudal system", "knights", "lance", "medieval", "minstrels", "monks", "noblemen", "peasants", "pike", "saints", "serfs", "sword", "vassals"]
                    })
    puzzles.push({ name: "Missions Of The Californias",
                     category: "History",
                     words: ["El Descanso", "San Antonio de Padua", "San Bruno", "San Buenaventura", "San Diego de Alcala", "San Francisco Borja", "San Francisco de Asis", "San Gabriel Arcangel", "San Jose de Guadalupe", "San Juan Bautista", "San Juan Capistrano", "San Vincente Ferrer", "Santa Barbara", "Santa Clara de Asis", "Santa Cruz", "Santa Gertrudis", "Santa Ines"]
                    })
    puzzles.push({ name: "Native American Tribes",
                     category: "History",
                     words: ["Apache", "Blackfoot", "Cherokee", "Cheyenne", "Chickasaw", "Chippewa", "Choctaw", "Comanche", "Cree", "Creek", "Crow", "Delaware", "Iroquois", "Kiowa", "Lumbee", "Navajo", "Osage", "Paiute", "Pima", "Potawatomi", "Pueblo", "Seminole", "Shoshone", "Sioux", "Yaqui"]
                    })
    puzzles.push({ name: "Notable American Historical Events",
                     category: "History",
                     words: ["Battle of Gettysburg", "Battle of Normandy", "Boston Tea Party", "California Gold Rush", "Civil Rights Act", "Civil War", "First World War", "Great Chicago Fire", "Great Depression", "Johnstown Flood", "Louisiana Purchase", "Monroe Doctrine", "New Deal", "Pearl Harbor", "Prohibition", "Reconstruction", "Second World War", "Spanish-American War", "Texas Annexation", "Treaty of Paris"]
                    })
    puzzles.push({ name: "Notable American Inventions",
                     category: "History",
                     words: ["Air Conditioner", "Airplane", "Artificial Heart", "Bifocals", "Burglar Alarm", "Calculator", "Camera", "Coffee Pot", "Defibrillator", "Electric Fan", "Hearing Aid", "Integrated Circuit", "Internet", "Laser", "Microwave Oven", "Nuclear Submarine", "Nylon", "Optical Fiber", "Polio Vaccine", "Revolver", "Roller Skates", "Sewing Machine", "Space Shuttle", "Telephone", "Water Tower"]
                    })
    puzzles.push({ name: "Notable Explorers",
                     category: "History",
                     words: ["Amerigo Vespucci", "Cristobal de Acuna", "Emin Pasha", "Ferdinand Magellan", "Henry Hudson", "Hernando De Soto", "Jacques Cartier", "James Bruce", "John Cabot", "Jonathan Carver", "Juan Ponce de Leon", "Leif Ericsson", "Lincoln Ellsworth", "Louis Jolliet", "Marco Polo", "Meriwether Lewis", "Roald Amundsen", "Robert Gray", "Sebastian Cabot", "Sir Francis Drake", "Sir Walter Raleigh", "William Clark"]
                    })
    puzzles.push({ name: "Notable Political And Military Leaders",
                     category: "History",
                     words: ["Abraham Lincoln", "Alexander the Great", "Catherine the Great", "Charles de Gaulle", "Cleopatra", "Elizabeth I", "Frederick I", "Genghis Khan", "Hatshepsut", "Huayna Capac", "Julius Caesar", "Louis XIV", "Mahatma Gandhi", "Mao Zedong", "Margaret Thatcher", "Napoleon Bonaparte", "Otto von Bismarck", "Quin Shi-Huang", "Salah al-Din", "Tokugawa Ieyasu", "Victoria I", "Winston Churchill"]
                    })
    puzzles.push({ name: "Notable Scientists And Thinkers",
                     category: "History",
                     words: ["Alan Turing", "Albert Einstein", "Alexander Fleming", "Carl Sagan", "Charles Darwin", "Edwin Hubble", "Enrico Fermi", "Francis Crick", "Galileo Galilei", "Hippocrates", "Isaac Newton", "James Watson", "Jean Piaget", "John Maynard Keynes", "Jonas Salk", "Kurt Godel", "Leo Baekeland", "Nicolaus Copernicus", "Philo Farnsworth", "Rachel Carson", "Robert Goddard", "Sigmund Freud", "Stephen Hawking", "William Shockley"]
                    })
    puzzles.push({ name: "Notable World Events Of The 1990s",
                     category: "History",
                     words: ["Apartheid Repealed", "Chunnel Opens", "Cold War Ends", "Dolly Cloned", "Ebola Virus", "Euro Currency", "Hale-Bopp Comet", "Hubble Telescope", "Internet Blossoms", "Mad Cow Disease", "Nelson Mandela Freed", "Okahoma City Bombing", "Rodney King Riots", "Rwandan Genocide", "Tokyo Subway Gassed", "USSR Collapses", "Unabomber Arrested", "WTC Bombed", "Waco Compound Raid"]
                    })
    puzzles.push({ name: "Pirates",
                     category: "History",
                     words: ["Andrew Cullen", "Anne Bonny", "Bartholomew Roberts", "Benjamin Hornigold", "Blackbeard", "Calico Rackham Jack", "Charles Vane", "Cheung Po Tsai", "Christopher Myngs", "Edward England", "Henry Every", "Henry Morgan", "Howell Davis", "Jean Laffite", "John Avery", "Mary Read", "Paulsgrave Williams", "Samuel Bellamy", "Sir Francis Drake", "Stede Bonnet", "Thomas Carman", "Thomas Tew", "Vincent Benavides", "William Kidd", "Woodes Rogers"]
                    })
    puzzles.push({ name: "Popes",
                     category: "History",
                     words: ["Adrian VI", "Alexander VIII", "Benedict XVI", "Blessed Innocent XI", "Blessed John XXIII", "Blessed Pius IX", "Boniface XI", "Callistus III", "Clement VII", "Clement XI", "Gregory XV", "Innocent XIII", "John Paul I", "John Paul II", "Julius II", "Leo X", "Marcellus II", "Martin V", "Nicholas V", "Paul II", "Paul VI", "Pius II", "Sixtus IV", "Urban VIII"]
                    })
    puzzles.push({ name: "Renaissance",
                     category: "History",
                     words: ["Bellini", "Boccaccio", "Castiglione", "Donatello", "Francesco Petrarch", "Ghiberti", "Giotto", "Leonardo da Vinci", "Lorenzo de Medici", "Masaccio", "Michelangelo", "Neoplatonism", "Niccolo Machiavelli", "Pico", "Raphael", "Sack of Rome", "Sandro Botticelli", "The Golden Age", "The Mona Lisa", "The Sistine Chapel", "Titian", "feudalism", "humanism", "individualism", "patron"]
                    })
    puzzles.push({ name: "Revolutionary War Battles",
                     category: "History",
                     words: ["Bennington", "Brandywine", "Bunker Hill", "Camden", "Cowpens", "Eutaw Springs", "Germantown", "Great Bridge", "Long Island", "Monmouth", "New York", "Oriskany", "Princeton", "Quebec", "Saratoga", "Savannah", "Stony Point", "Trenton", "Valcour Bay", "Vincennes", "Yorktown"]
                    })
    puzzles.push({ name: "Spanish American War Battles And Operations",
                     category: "History",
                     words: ["Aguadores", "Aibonito Pass", "Atlantic Operation", "Cardenas", "Caribbean Operation", "Cienfuegos", "Coamo", "El Caney", "Guamani", "Guantanamo Bay", "Guayama", "Las Guasimas", "Mani-Mani", "Manila Bay", "Manzanillo", "Nipe Bay", "San Juan", "San Juan Hill", "Santiago Heights", "Santiago de Cuba", "Silva Heights", "Tayacoba", "Yauco"]
                    })
    puzzles.push({ name: "Star Spangled Banner",
                     category: "History",
                     words: ["God", "beam", "brave", "country", "flag", "free", "freemen", "gallantly", "gleaming", "glory", "home", "land", "nation", "peace", "proudly", "ramparts", "rockets", "say", "slave", "stars", "stripes", "triumph", "trust", "war", "wave"]
                    })
    puzzles.push({ name: "Taj Mahal",
                     category: "History",
                     words: ["Crown Palace", "Agra", "Bageecha", "Darwaza", "India", "Islamic tomb", "Masjid", "Mumtaz Mahal", "Naqqar Khana", "Rauza", "River Yamuna", "Shah Jahan", "Ustad Isa", "calligraphy", "marble", "mausoleum", "mosaic", "octagon shape"]
                    })
    puzzles.push({ name: "The Aztecs",
                     category: "History",
                     words: ["Aztlan", "Chichimec", "Huitzilopochtli", "Itzacoatl", "Mexica", "Mixteca-Pueblo", "Mocteuzma I", "Mocteuzma II", "Nahuatl", "Omecihuatl", "Ometecuhtli", "Qetzalcoatl", "Tenochca", "Tenochtitlan", "Teotihuacan", "Toltec", "Toltec", "calmecac", "calpullec", "calpulli", "chinampa", "macehualles", "pilli", "telpuchcalli", "tlacatecuhtli"]
                    })
    puzzles.push({ name: "The Great Wall Of China",
                     category: "History",
                     words: ["Beijing", "Gansu", "Han Dynasty", "Hebei", "Inner Mongolia", "Jiayuguan Pass", "Liaoning", "Ming Dynasty", "Niangziguan Pass", "Ningxia", "Qin Dynasty", "Qin Shihuang", "Shaanxi", "Shanhaiguan Pass", "Shanxi", "The Huns", "Tianjin", "Western Zhou Dynasty", "Yan", "Yangguan Pass", "Yanmenguan Pass", "Yumenguan Pass", "Zhao", "unification"]
                    })
    puzzles.push({ name: "Thomas Edisons Inventions And Discoveries",
                     category: "History",
                     words: ["Edison Effect", "Edison dynamo", "Etheric Force", "battery", "carbon rheostat", "electric pen", "fluoroscope", "incandescent light", "motograph", "paraffin paper", "phonograph", "unison stop"]
                    })
    puzzles.push({ name: "U.S. Historic Sites and Memorials",
                     category: "History",
                     words: ["Fort Washington Park", "Santa Fe Trail", "Truman Historic Site"]
                    })
    puzzles.push({ name: "UK Prime Ministers",
                     category: "History",
                     words: ["Alec Douglas-Home", "Andrew Bonar Law", "Anthony Eden", "Arthur James Balfour", "Clement Attlee", "David Lloyd George", "Edward Heath", "Gordon Brown", "Harold MacMillan", "Harold Wilson", "Henry Addington", "James Callaghan", "John Major", "Margaret Thatcher", "Marquis of Salisbury", "Neville Chamberlain", "Ramsay MacDonald", "Spencer Perceval", "Stanley Baldwin", "The Earl Grey", "The Earl of Aberdeen", "Tony Blair", "Winston Churchill"]
                    })
    puzzles.push({ name: "Vietnam War Battles And Operations",
                     category: "History",
                     words: ["Ap Bac", "Attleboro", "Cedar Falls", "Chopper", "Crimp", "Cu Nghi", "Dak To", "Deckhouse Five", "Dienbienphu", "Hue", "Ia Drang", "Junction City", "Khe Sanh", "Kontum", "Linebacker", "Menu", "Niagara", "Pegasus", "Ranch Hand", "Rolling Thunder", "Saigon", "Starlight", "Tet Offensive"]
                    })
    puzzles.push({ name: "World War II",
                     category: "History",
                     words: ["Allies", "Auschwitz", "Axis", "Battle of Midway", "Battle of Stalingrad", "D-Day", "France", "Germany", "Gestapo", "Great Britain", "Hiroshima", "Holocaust", "Italy", "Japan", "Manhattan Project", "Nagasaki", "Nazi", "Normandy", "Pearl Harbor", "Soviet Union", "U-boats", "United States", "Warsaw Uprising", "atomic bomb"]
                    })
    puzzles.push({ name: "4th of July",
                     category: "Holidays",
                     words: ["Adams", "Barbecue", "Baseball", "Blue", "Congress", "Constitution", "Declaration", "Fireworks", "Fourth", "Hancock", "Holiday", "Hot Dog", "Independence", "Jefferson", "July", "Parade", "Patriotism", "Philadelphia", "Picnic", "Red", "Stars", "Stripes", "White", "Yankee Doodle"]
                    })
    puzzles.push({ name: "Chinese New Year",
                     category: "Holidays",
                     words: ["China", "Dog", "Dragon", "Dumplings", "Family", "Fireworks", "Horse", "Lanterns", "Lion dance", "Lunar", "Mandarins", "Monkey", "Ox", "Packets", "Pig", "Plum tree", "Rabbit", "Rat", "Red", "Rooster", "Sheep", "Snake", "Spring", "Tiger", "Tikoy"]
                    })
    puzzles.push({ name: "Christmas",
                     category: "Holidays",
                     words: ["Boxing Day", "Chimney", "Cranberries", "Drummer boy", "Egg nog", "Fruitcake", "Gifts", "Holly", "Jesus", "Jingle bells", "Kris Kringle", "Manger", "Orange", "Ornament", "Red", "Santa Claus", "Shopping", "Silent night", "Stocking", "Tree", "Turkey", "White", "Wisemen", "Wreath", "Yuletide"]
                    })
    puzzles.push({ name: "Christmas",
                     category: "Holidays",
                     words: ["Blitzen", "Caroling", "Chestnuts", "Christmas Tree", "Comet", "Cupid", "Dancer", "Dasher", "Donner", "Elfs", "Frosty the Snowman", "Fruitcake", "Lumps of coal", "Mistletoe", "North Pole", "Poinsettias", "Prancer", "Presents", "Reindeer", "Rudolph", "Santa Claus", "Scrooge", "Sleigh", "Stockings", "Vixen"]
                    })
    puzzles.push({ name: "Christmas",
                     category: "Holidays",
                     words: ["Advent", "Angels", "Balthazar", "Bethlehem", "Caspar", "Herod", "Immanuel", "Jesus", "Joseph", "Love", "Manger", "Mary", "Melchior", "Nativity", "Nazareth", "Noel", "Peace", "Savior", "Shepherds", "Star", "Wise Men", "frankincense", "gold", "myrrh"]
                    })
    puzzles.push({ name: "Cinco De Mayo",
                     category: "Holidays",
                     words: ["Battle of Puebla", "French", "Mexican", "Zaragoza", "chili", "conquest", "dances", "fiesta", "five", "flowers", "freedom", "green", "independence", "maracas", "mariachis", "music", "parades", "red", "salsa", "sombrero", "tortilla", "triumph", "white"]
                    })
    puzzles.push({ name: "Earth Day",
                     category: "Holidays",
                     words: ["Earth", "San Francisco", "Vernal Equinox", "air pollution", "conserve", "ecology", "endangered species", "energy", "environment", "forest", "global warming", "oceans", "ozone layer", "planet", "protect", "recycle", "reduce", "reuse", "smog", "soil pollution", "trees", "water pollution", "wildlife"]
                    })
    puzzles.push({ name: "Easter",
                     category: "Holidays",
                     words: ["Bunny", "Chocolate", "Christian", "Church", "Crucifixion", "Disciples", "Egg hunt", "Eggs", "Ham", "Holiday", "Hot cross buns", "Jesus", "Judas", "Last supper", "Lily", "Marshmallow", "Mass", "Monday", "Painting", "Pascha", "Purple", "Resurrection", "Sunday", "Vigil", "Yellow"]
                    })
    puzzles.push({ name: "Father's Day",
                     category: "Holidays",
                     words: ["Appreciation", "Card", "Celebration", "Coffee mug", "Dad", "Daughter", "Family", "Father", "Gift", "Mow the lawn", "Old man", "Padre", "Papa", "Parent", "Party", "Pere", "Poem", "Pops", "Socks", "Son", "Sonora Dodd", "Sunday", "Tie", "Vatertag"]
                    })
    puzzles.push({ name: "Frank Sinatra Christmas ",
                     category: "Holidays",
                     words: ["A Baby Just Like You", "Adeste Fideles", "Ave Maria", "Christmas Dreaming", "Christmas Memories", "Jingle Bells", "Mistletoe and Holly", "Silent Night", "The Christmas Song", "The Christmas Waltz", "The First Noel", "White Christmas", "Winter Wonderland"]
                    })
    puzzles.push({ name: "Groundhog Day",
                     category: "Holidays",
                     words: ["Canada", "Candlemas Day", "February", "Phil", "Punxsutawney", "United States", "burrow", "cloudy", "early", "forecast", "ground squirrel", "hibernate", "hide", "hole", "marmot", "peeks", "predict", "shadow", "six", "spring", "sunshine", "weather", "weeks", "winter", "woodchuck"]
                    })
    puzzles.push({ name: "Halloween",
                     category: "Holidays",
                     words: ["bat", "black cat", "bones", "candy", "cauldron", "cobwebs", "costumes", "full moon", "ghost", "ghoul", "goblin", "graveyard", "haunted house", "jack-o-lantern", "masks", "monster", "mummy", "pumpkin patch", "skeleton", "spiders", "vampire", "werewolf", "witch", "zombie"]
                    })
    puzzles.push({ name: "Halloween Costumes",
                     category: "Holidays",
                     words: ["angel", "astronaut", "ballerina", "bunny", "cat", "clown", "cowboy", "dragon", "fairy", "firefighter", "ghost", "hippie", "hula dancer", "knight", "ninja", "nurse", "pirate", "policeman", "princess", "pumpkin", "robot", "skeleton", "vampire", "witch", "zombie"]
                    })
    puzzles.push({ name: "Hanukkah",
                     category: "Holidays",
                     words: ["Altar", "Blessing", "Candles", "Chanukkah", "Doughnuts", "Dreidel", "Eight", "Gelt", "Jerusalem", "Jewish", "Kislev", "Latke", "Lights", "Maccabees", "Menorah", "Miracle", "Mitzvah", "Nightfall", "Oil", "Singing", "Songs", "Talmud", "Temple", "Tevet", "Torah"]
                    })
    puzzles.push({ name: "Kwanzaa",
                     category: "Holidays",
                     words: ["African", "Ancestry", "Candle", "Dance", "Drumming", "Feast", "First fruits", "Habari Gani", "Heritage", "Imani", "Karenga", "Kinara", "Kujichagulia", "Kuumba", "Libations", "Nia", "Principles", "Seven", "Swahili", "Ujamaa", "Ujima", "Umoja", "Uwole"]
                    })
    puzzles.push({ name: "Labor Day",
                     category: "Holidays",
                     words: ["Back to School", "End of Summer", "Canada", "Central Labor Union", "Colorado", "Knights of Labor", "Massachusetts", "Matthew Maguire", "Monday", "New Jersey", "New York", "Oregon", "Peter McGuire", "September", "Union Square", "United States", "parade", "unions", "working class"]
                    })
    puzzles.push({ name: "Mother's Day",
                     category: "Holidays",
                     words: ["Ann Jarvis", "Anna Jarvis", "Appreciation", "Breakfast", "Card", "Chocolate", "Daughter", "Family", "Flowers", "Gift", "Hug", "Julia Ward Howe", "Kiss", "Love", "Madre", "Mama", "Maman", "Mamma Mia", "Mom", "Mother", "Parent", "Restaurant", "Son", "Spa", "Sunday"]
                    })
    puzzles.push({ name: "New Year's Day",
                     category: "Holidays",
                     words: ["Auld Lang Syne", "Calendar", "Change", "Confetti", "Countdown", "Dick Clarke", "Fireworks", "Football", "Giant ball", "Gregorian", "Habits", "Hat", "Holiday", "January", "Kazoo", "Kiss", "Midnight", "Orange Bowl", "Otoshidamas", "Parade", "Party", "Resolution", "Times Square", "Toast", "Universal"]
                    })
    puzzles.push({ name: "St Patrick's Day",
                     category: "Holidays",
                     words: ["Christian", "Clover", "Dublin", "Emerald", "Expatriate", "Feast", "Gold", "Green", "Guinness", "Holiday", "Holy trinity", "Ireland", "Irish", "Leprechaun", "Limerick", "Luck", "Mass", "Paddy", "Parade", "Patron saint", "Rainbow", "Roman Catholic", "Shamrock"]
                    })
    puzzles.push({ name: "St Valentine's Day",
                     category: "Holidays",
                     words: ["Arrow", "Candle", "Candy", "Card", "Chocolate", "Couple", "Cupid", "Dedication", "February", "Fourteenth", "Gift", "Hallmark", "Heart", "Jewelry", "Love", "Notes", "Ode", "Perfume", "Poem", "Red", "Romance", "Roses", "Saint", "Secret", "Valentine"]
                    })
    puzzles.push({ name: "Thanksgiving",
                     category: "Holidays",
                     words: ["Carve", "Celebration", "Cranberry Sauce", "Fall", "Gratitude", "Gravy", "Horn of Plenty", "Indian Corn", "Maize", "Mashed Potatoes", "Mayflower", "Native Americans", "November", "Pilgrims", "Plymouth", "Pumpkin Pie", "Squanto", "Stuffing", "Sweet Potatoes", "Thursday", "Turkey", "Yams", "cornucopia", "harvest"]
                    })
    puzzles.push({ name: "The Carpenter's Christmas",
                     category: "Holidays",
                     words: ["Ave Maria", "Carol of the Bells", "Christ Is Born", "Christmas Song", "Christmas Waltz", "Frosty the Snowman", "Good King Wenceslas", "Little Altar Boy", "O Come O Come Emmanuel", "O Holy Night", "O Holy Night", "Silent Night", "Silver Bells", "Sleigh Ride", "White Christmas", "Winter Wonderland"]
                    })
    puzzles.push({ name: "Valentine Conversation Hearts",
                     category: "Holidays",
                     words: ["All Mine", "All Star", "Angel", "Awesome", "Be Good", "Be Mine", "Be True", "Cool", "For You", "How Nice", "I Hope", "Kiss Me", "Lets Kiss", "Love", "Love Her", "Love Life", "Love Me", "Love You", "My Baby", "My Way", "Sweet Talk", "True Love"]
                    })
    puzzles.push({ name: "Valentines Day",
                     category: "Holidays",
                     words: ["Be Mine", "Cupid", "February", "arrows", "boyfriend", "cards", "chocolate", "date", "doily", "dove", "flowers", "forever", "frills", "girlfriend", "hearts", "hugs", "jewelry", "kisses", "lace", "love", "marry", "poems", "romance", "sweetheart"]
                    })
    puzzles.push({ name: "Veteran's Day",
                     category: "Holidays",
                     words: ["Air Force", "Army", "Marines", "Navy", "November", "artillery", "battle", "courage", "defend", "freedom", "guard", "heroes", "history", "honor", "infantry", "memorial", "military", "militia", "national", "peace", "protect", "soldier", "valor", "veterans", "war"]
                    })
    puzzles.push({ name: "Types Of Stitches",
                     category: "Home Economics",
                     words: ["Y-stitch", "back", "bobble", "catch", "chain", "colonial knot", "couching", "crazy", "cross", "feather", "french knot", "half", "hemming", "herringbone", "knit", "lazy daisy", "outline", "oversewing", "purl", "quarter", "running", "satin", "slip", "tacking", "three-quarter"]
                    })
    puzzles.push({ name: "Bones",
                     category: "Human Anatomy",
                     words: ["carpals", "clavicle", "coccyx", "cranium", "femur", "fibula", "humerus", "ilium", "incus", "malleus", "mandible", "metacarpals", "metatarsals", "patella", "phalanges", "radius", "ribs", "sacrum", "scapula", "stapes", "sternum", "tarsals", "tibia", "ulna", "vertebrae"]
                    })
    puzzles.push({ name: "Glands",
                     category: "Human Anatomy",
                     words: ["adrenal", "apocrine", "endocrine", "esophageal", "exocrine", "holocrine", "mammary", "merocrine", "mucous", "parotoid", "pituitary", "pyloric", "salivary", "sebaceous", "serous", "sublingual", "sweat", "thyroid"]
                    })
    puzzles.push({ name: "Human Eye",
                     category: "Human Anatomy",
                     words: ["choroid", "ciliary body", "conjunctiva", "cornea", "endothelium", "epithelium", "extraocular muscles", "eyelids", "fovea", "iris", "lens", "levator muscle", "macula", "optic disc", "optic nerve", "pupil", "retina", "sclera", "stroma", "tear film", "vitreous", "zonules"]
                    })
    puzzles.push({ name: "Human Respiratory System",
                     category: "Human Anatomy",
                     words: ["adenoids", "alveolus", "bronchial cilia", "bronchiole", "capillaries", "diaphragm", "epiglottis", "esophagus", "frontal sinus", "lungs", "lymph node", "maxillary sinus", "mouth", "nose", "pleura", "ribs", "sphenoidal sinus", "throat", "tongue", "tonsils", "trachea", "voice box", "windpipe"]
                    })
    puzzles.push({ name: "Human Skull",
                     category: "Human Anatomy",
                     words: ["alveolar process", "angle of jaw", "coronal suture", "ethmoid bone", "forehead boss", "frontal bone", "glabella", "lacrimal bone", "lambdoid suture", "mandible", "maxilla", "mental protuberance", "mental tuberosity", "nasal bone", "nasal concha", "nasal spine", "parietal bone", "ramus", "sphenoid bone", "squamosal suture", "temporal bone", "volmer", "zygomatic bone"]
                    })
    puzzles.push({ name: "Muscles",
                     category: "Human Anatomy",
                     words: ["biceps brachii", "biceps femoris", "brachialis", "deltoid", "external oblique", "gastrocnemius", "gluteus maximus", "gluteus medius", "gluteus minimus", "internal oblique", "latissimus dorsi", "pectoralis major", "pectoralis minor", "pyramidalis", "rectus abdominis", "rectus femoris", "rhomboid major", "rhomboid minor", "soleus", "subclavius", "trapezius", "triceps brachii", "vastus lateralis", "vastus medialis"]
                    })
    puzzles.push({ name: "Organs",
                     category: "Human Anatomy",
                     words: ["adrenal glands", "appendix", "bladder", "brain", "ears", "esophagus", "eye", "gall bladder", "heart", "hypothalamus", "kidneys", "large intestine", "liver", "lungs", "pancreas", "parathyroid gland", "salivary glands", "skin", "small intestine", "spinal cord", "spleen", "stomach", "thymus", "thyroid", "tongue"]
                    })
    puzzles.push({ name: "Parts Of Brain",
                     category: "Human Anatomy",
                     words: ["amygdala", "brainstem", "cerebellum", "cerebral peduncle", "cerebrum", "corpus callosum", "frontal lobe", "hippocampus", "hypothalamus", "inferior colliculus", "limbic system", "medulla", "midbrain", "neocortex", "occipital lobe", "parietal lobe", "pons", "substantia nigra", "superior colliculus", "tectum", "tegmentum", "temporal lobe", "thalamus", "uncus"]
                    })
    puzzles.push({ name: "Parts Of Heart",
                     category: "Human Anatomy",
                     words: ["aorta", "aortic valve", "bundle of His", "circumflex artery", "coronary sinus", "inferior vena cava", "left atrium", "left coronary artery", "left ventricle", "mitral valve", "myocardium", "pulmonary artery", "pulmonary valve", "pulmonary vein", "right atrium", "right ventricle", "semilunar valve", "septum", "sinoatrial node", "superior vena cava", "tricuspid valve"]
                    })
    puzzles.push({ name: "Teeth",
                     category: "Human Anatomy",
                     words: ["amelogenin", "aveolus", "bicuspids", "canine", "cementoblasts", "cementum", "central incisors", "crown", "cusp", "dental follicle", "dental papilla", "dentine", "enamel", "enamelins", "first molar", "gum", "lateral incisors", "nerve", "periodontium", "pulp", "root", "second molar", "supernumary teeth", "wisdom"]
                    })
    puzzles.push({ name: "Feelings",
                     category: "Human Behavior",
                     words: ["anxious", "ashamed", "bored", "confident", "confused", "disgusted", "ecstatic", "enraged", "frustrated", "guilty", "happy", "hopeful", "hysterical", "jealous", "lonely", "mad", "mischievous", "overwhelmed", "sad", "scared", "shocked", "shy", "smug", "surprised", "suspicious"]
                    })
    puzzles.push({ name: "Movement",
                     category: "Human Behavior",
                     words: ["Cartwheel", "Crawl", "Creep", "Dive", "Fall", "Fly", "Hike", "Hop", "Jog", "Jump", "Leap", "Pounce", "Run", "Sit", "Skip", "Sneak", "Spin", "Sprint", "Stalk", "Stomp", "Swing", "Tiptoe", "Trip", "Tumble", "Walk"]
                    })
    puzzles.push({ name: "Phobias",
                     category: "Human Behavior",
                     words: ["acrophobia", "agoraphobia", "arachnophobia", "bibliophobia", "claustrophobia", "coulrophobia", "demophobia", "dendrophobia", "electrophobia", "equinophobia", "felinophobia", "gerascophobia", "heliophobia", "hypnophobia", "insectophobia", "isolophobia", "kenophobia", "lockiophobia", "maniaphobia", "neophobia", "ophidiophobia", "pupaphobia", "radiophobia", "social phobia", "trypanophobia"]
                    })
    puzzles.push({ name: "African Languages",
                     category: "Languages",
                     words: ["Afro-Asiatic", "Anlo", "Arabic", "Bete", "Gibanawa", "Hausa", "Hwla", "Kara", "Khosian", "Kongo", "Korobore", "Krio", "Kujarge", "Laal", "Lufu", "Luo", "Mawa", "Nemadi", "Niger-Congo", "Nilo-Saharan", "Rer Bare", "Swahili", "Weyto", "Yauma", "Yeni", "Zulu"]
                    })
    puzzles.push({ name: "Borrowed Chinese Words",
                     category: "Languages",
                     words: ["bok choy", "chop suey", "chow", "chow chow", "chow mein", "feng shui", "ginseng", "kumquat", "kung fu", "longan", "loquat", "lychee", "oolong", "pekoe", "sampan", "shar-pei", "tai chi", "tea", "tong", "typhoon", "wok", "wonton", "yang", "yen", "yin"]
                    })
    puzzles.push({ name: "Borrowed French Terms",
                     category: "Languages",
                     words: ["a deux", "a la carte", "a la mode", "adieu", "ambiance", "apres-ski", "au gratin", "au naturel", "au pair", "avant-garde", "blase", "bon appetit", "bon voyage", "bourgeois", "cafe", "cliche", "corsage", "cul-de-sac", "deja vu", "en garde", "en route", "faux pas", "fiancee", "gourmet", "touche"]
                    })
    puzzles.push({ name: "Borrowed Japanese Words",
                     category: "Languages",
                     words: ["anime", "bonsai", "futon", "geisha", "ginkgo", "haiku", "hibachi", "judo", "jujitsu", "kamikaze", "karaoke", "karate", "kimono", "ninja", "origami", "ramen", "rickshaw", "sake", "samurai", "sushi", "teriyaki", "tofu", "tsunami", "tycoon", "wasabi"]
                    })
    puzzles.push({ name: "Borrowed Latin Terms",
                     category: "Languages",
                     words: ["a cappella", "a priori", "ad hoc", "alma mater", "alter ego", "ante bellum", "bona fide", "carpe diem", "cum laude", "de facto", "et cetera", "ex post facto", "homo sapiens", "in vitro", "ipso facto", "magna carta", "magna cum laude", "mea culpa", "per capita", "per diem", "post mortem", "pro bono", "quid pro quo", "status quo", "vice versa"]
                    })
    puzzles.push({ name: "Borrowed Spanish Words",
                     category: "Languages",
                     words: ["adios", "adobe", "alfalfa", "arroyo", "avocado", "cafeteria", "canyon", "cargo", "chili", "condor", "embargo", "fiesta", "lasso", "llama", "machete", "mesa", "patio", "plaza", "poncho", "pronto", "rodeo", "salsa", "siesta", "silo", "tango"]
                    })
    puzzles.push({ name: "European Languages",
                     category: "Languages",
                     words: ["Bosnian", "Bulgarian", "Croatian", "Danish", "Dutch", "English", "French", "German", "Greek", "Hungarian", "Icelandic", "Irish", "Italian", "Lithuanian", "Macedonian", "Polish", "Portuguese", "Romanian", "Russian", "Serbian", "Slovak", "Spanish", "Swedish", "Turkish", "Welsh"]
                    })
    puzzles.push({ name: "French Words And Phrases",
                     category: "Languages",
                     words: ["au revoir", "bonjour", "bonne nuit", "combien", "excusez-moi", "je ne comprends pas", "je ne sais pas", "je veux", "je voudrais", "madame", "merci", "monsieur", "non", "oui", "voici"]
                    })
    puzzles.push({ name: "German Words And Phrases",
                     category: "Languages",
                     words: ["auf wiedersehen", "bis bald", "bitte", "bitte schon", "danke schon", "frau", "fraulein", "gut", "gute nacht", "guten abend", "guten morgen", "guten tag", "hallo", "herr", "ich liebe dich", "ja", "nein", "so lala", "tschau", "willkommen", "wo ist", "wo sind"]
                    })
    puzzles.push({ name: "International Goodbyes",
                     category: "Languages",
                     words: ["adios", "aman", "au revoir", "ba-ba", "bless", "caw", "cheerio", "ciao", "farvel", "geia", "hejdo", "hooroo", "jaaw", "nameste", "nye", "pa", "paalam", "poka", "sawatdi", "sayonara", "sudie", "ta-ta"]
                    })
    puzzles.push({ name: "International Greetings",
                     category: "Languages",
                     words: ["aloha", "bok", "bonjour", "bore da", "buna", "ciao", "hafa", "hallo", "hei", "hej", "hello", "hoi", "hola", "jambo", "mambo", "marhaba", "namaste", "oi", "salam", "sawubona", "shalom", "tere"]
                    })
    puzzles.push({ name: "Italian Words And Phrases",
                     category: "Languages",
                     words: ["a domani", "a presto", "arrivederci", "buon giorno", "buona notte", "buona sera", "ciao", "grazie", "mi chiamo", "mi dispiace", "no", "per favore", "prego", "scusi", "si", "signora", "signore", "signorina", "sto bene", "ti amo", "va bene"]
                    })
    puzzles.push({ name: "Most Widely Spoken Languages In The World",
                     category: "Languages",
                     words: ["Arabic", "Bengali", "English", "Farsi", "French", "German", "Hindi", "Italian", "Japanese", "Javanese", "Korean", "Malay-Indonesian", "Mandarin", "Marathi", "Portuguese", "Punjabi", "Russian", "Spanish", "Tamil", "Telegu", "Thai", "Turkish", "Urdu", "Vietnamese", "Wu"]
                    })
    puzzles.push({ name: "Spanish Calendar",
                     category: "Languages",
                     words: ["abril", "agosto", "dia", "diciembre", "domingo", "enero", "febrero", "invierno", "jueves", "julio", "junio", "lunes", "martes", "marzo", "mayo", "mes", "miercoles", "noviembre", "octubre", "otono", "primavera", "sabado", "septiembre", "verano", "viernes"]
                    })
    puzzles.push({ name: "Spanish Conjugations",
                     category: "Languages",
                     words: ["eres", "es", "esta", "estamos", "estan", "estas", "estoy", "somos", "son", "soy", "tenemos", "tengo", "tiene", "tienen", "tienes", "va", "vamos", "van", "vas", "vive", "viven", "vives", "vivimos", "vivo", "voy"]
                    })
    puzzles.push({ name: "Spanish Verbs",
                     category: "Languages",
                     words: ["abrir", "ayudar", "comer", "comprar", "correr", "decir", "dormir", "escuchar", "estar", "hacer", "ir", "jugar", "mirar", "pensar", "poner", "preguntar", "querer", "saber", "ser", "tener", "trabajar", "usar", "vender", "ver", "vivir"]
                    })
    puzzles.push({ name: "The Iliad Characters",
                     category: "Literature",
                     words: ["Achilles", "Aeneas", "Agenor", "Andromache", "Antenor", "Aphrodite", "Astyanax", "Calchas", "Diomedes", "Dolon", "Glaucus", "Great Ajax", "Hector", "Hecuba", "Idomeneus", "Little Ajax", "Machaon", "Pandarus", "Paris", "Patroclus", "Peleus", "Phoenix", "Polydamas", "Priam", "The Myrmidons"]
                    })
    puzzles.push({ name: "The Odyssey Characters",
                     category: "Literature",
                     words: ["Agamemnon", "Alcinous", "Amphinomus", "Antinous", "Arete", "Athena", "Calypso", "Circe", "Eumaeus", "Eurycleia", "Eurymachus", "Helen", "Laertes", "Melanthius", "Melantho", "Menelaus", "Nausicaa", "Nestor", "Odysseus", "Penelope", "Polyphemus", "Poseidon", "Telemachus", "Tiresias", "Zeus"]
                    })
    puzzles.push({ name: "2008 Bestsellers",
                     category: "Literature",
                     words: ["Audition", "Divine Justice", "Dreams From My Father", "Hollow", "Hungry Girl", "Just After Sunset", "New Moon", "Outliers", "Plum Lucky", "Sail", "Scarpetta", "The Audacity of Hope", "The Brass Verdict", "The Host", "The Kite Runner", "The Secret", "The Shack", "The Whole Truth", "Tribute", "Twilight"]
                    })
    puzzles.push({ name: "Artemis Fowl Characters",
                     category: "Literature",
                     words: ["Angeline Fowl", "Ark Sool", "Arno Blunt", "Artemis Fowl", "Billy Kong", "Briar Cudgeon", "Captain Holly Short", "Chix Verbil", "Corporal Grub Kelp", "Damon Kronski", "Domovoi Butler", "Doodah Day", "Foaly", "Goblins", "Jayjay", "Jon Spiro", "Juliet Butler", "Leon Abbot", "Minerva Paradizo", "Mulch Diggums", "Opal Koboi", "Qwan", "Trouble Kelp", "Turnball Root"]
                    })
    puzzles.push({ name: "Baby-Sitters Club Books",
                     category: "Literature",
                     words: ["Abby and The Bad Sport", "Boy-Crazy Stacey", "Dawn Saves The Planet", "Dawn on The Coast", "Kristy For President", "Kristy and The Snobs", "Kristy at Bat", "The Summer Before"]
                    })
    puzzles.push({ name: "Beatrix Potter Characters",
                     category: "Literature",
                     words: ["Babbity", "Benjamin Bunny", "Cecily Parsley", "Cottontail", "Flopsy", "Ginger", "Goody", "Hunca Munca", "Jemima Puddle-Duck", "Jeremy Fisher", "Miss Moppet", "Mittens", "Mopsy", "Percy", "Peter Rabbit", "Pig-Wig", "Pigling Bland", "Ribby", "Squirrel Nutkin", "Tipkins", "Tom Kitten"]
                    })
    puzzles.push({ name: "Beverly Cleary Books",
                     category: "Literature",
                     words: ["Beezus and Ramona", "Ellen Tebbits", "Henry Huggins", "Henry and Beezus", "Henry and Ribsy", "Lucky Chuck", "Mitch and Amy", "Muggie Maggie", "Otis Spofford", "Ramona Forever", "Ramona and Her Father", "Ramona and Her Mother", "Ramona the Brave", "Ramona the Pest", "Ribsy", "Runaway Ralph", "Socks", "Strider"]
                    })
    puzzles.push({ name: "Beverly Cleary Characters",
                     category: "Literature",
                     words: ["Beezus Quimby", "Daisy Kidd", "Ellen Tebbits", "Emily Bartlett", "Fong Quock", "Henry Huggins", "Howie Kemp", "Kisser", "Leigh Botts", "Little Davy", "Maggie Schultz", "Miss Binney", "Otis Spofford", "Pete Ginty", "Picky-Picky", "Ramona Quimby", "Ribsy", "Roberta Quimby", "Socks", "Susan Kushner", "Willa Jean Kemp", "Yard Ape"]
                    })
    puzzles.push({ name: "Boxcar Children Books",
                     category: "Literature",
                     words: ["Bicycle Mystery", "Blue Bay Mystery", "Bus Station Mystery", "Caboose Mystery", "Mountain Top Mystery", "Mystery Ranch", "Mystery in the Sand", "Old Motel Mystery", "Snowbound Mystery", "Surprise Island", "The Boxcar Children", "The Dinosaur Mystery", "The Mystery Cruise", "The Mystery Girl", "The Mystery Horse", "The Pizza Mystery", "The Woodshed Mystery", "Tree House Mystery"]
                    })
    puzzles.push({ name: "C.S. Lewis",
                     category: "Literature",
                     words: ["Little Lea", "Christianity", "Clive Staples", "Death in Battle", "Dymer", "Hugo Dyson", "Joy Davidman Gresham", "Mere Christianity", "Nickname Jack", "Oxford scholar", "Shadowlands", "Spirits in", "Surprised by Joy", "The Allegory of Love", "The Inklings", "World War I soldier"]
                    })
    puzzles.push({ name: "Canterbury Tales Characters",
                     category: "Literature",
                     words: ["Chaucer", "The Canon", "The Clerk", "The Cook", "The Franklin", "The Friar", "The Guildsmen", "The Host", "The Knight", "The Man of Law", "The Manciple", "The Merchant", "The Miller", "The Monk", "The Pardoner", "The Parson", "The Physician", "The Plowman", "The Prioress", "The Reeve", "The Second Nun", "The Shipman", "The Squire", "The Summoner", "The Wife of Bath"]
                    })
    puzzles.push({ name: "Catch 22 Characters",
                     category: "Literature",
                     words: ["Aarfy", "Appleby", "Captain Black", "Clevinger", "Colonel Cathcart", "Colonel Korn", "Colonel Moodus", "Dobbs", "Doc Daneeka", "Dunbar", "General Dreedle", "General Peckem", "Havermeyer", "Hungry Joe", "Huple", "Luciana", "Major Danby", "McWatt", "Michaela", "Mudd", "Nately", "Nurse Duckett", "Orr", "Snowden", "Yossarian"]
                    })
    puzzles.push({ name: "Charles Dickens",
                     category: "Literature",
                     words: ["A Christmas Carol", "A Christmas Tree", "A Flight", "A Tale of Two Cities", "American Notes", "Barnaby Rudge", "Bleak House", "Frozen Deep", "Going Into Society", "Great Expectations", "Hard Times", "Hunted Down", "Little Dorrit", "Martin Chuzzlewit", "Nicholas Nickelby", "Oliver Twist", "Our Mutual Friend", "The Battle of Life", "The Haunted Man", "The Holly-Tree", "The Long Voyage", "The Pickwick Papers"]
                    })
    puzzles.push({ name: "Children's Authors",
                     category: "Literature",
                     words: ["Barbara Park", "Beverly Cleary", "Carolyn Keene", "Crockett Johnson", "Judy Blume", "Lemony Snicket", "Margaret Wise Brown", "Margery Williams", "Marjorie Flack", "Maurice Sendak", "Norman Bridwell", "Peggy Parish", "Rosemary Wells", "Russell Hoban", "Shel Silverstein", "Watty Piper", "Roald Dahl"]
                    })
    puzzles.push({ name: "Children's Bestselling Books ",
                     category: "Literature",
                     words: ["A Visitor for Bear", "Alicia", "Alphabet", "Best At Everything", "Diary of a Wimpy Kid", "Dylan", "Fancy Nancy", "Harry Potter", "Knuffle Bunny Too", "Ladybug Girl", "Lock and Key", "Massie", "Nick of Time", "Pendragon", "Rumors", "Tempted", "The Big Field", "The Book Thief", "The Twilight Saga", "Wall-E"]
                    })
    puzzles.push({ name: "Children's Magazines",
                     category: "Literature",
                     words: ["American Girl", "Click", "Creative Kids", "Cricket", "Discovery Girls", "Disney And Me", "Disney Girl", "Dogs for Kids", "Family Fun", "Fun For Kidz", "Highlights", "Hopscotch", "Iguana", "Jack and Jill", "Ladybug", "Mad for Kids", "Parent and Child", "Preschool Playroom", "Winner", "Wondertime"]
                    })
    puzzles.push({ name: "Classic Mysteries",
                     category: "Literature",
                     words: ["Aristotle Detective", "Benito Cereno", "Gorky Park", "Green is For Danger", "In Cold Blood", "Red Harvest", "Tales", "The Bat", "The Big Bow Mystery", "The Blue Hammer", "The Bride Wore Black", "The Circular Study", "The Long Goodbye", "The Moonstone", "The Name of the Rose", "The Tiger in the Smoke", "The Woman in White"]
                    })
    puzzles.push({ name: "Curious George Books",
                     category: "Literature",
                     words: ["Curious George"]
                    })
    puzzles.push({ name: "Dr. Seuss Books",
                     category: "Literature",
                     words: ["Cat in the Hat", "Fox in Socks", "Great Day for Up", "Green Eggs and Ham", "Happy Birthday to You", "Hop on Pop", "Horton Hears A Who", "Hunches in Bunches", "If I Ran the Circus", "If I Ran the Zoo", "My Book About Me", "On Beyond Zebra", "The Foot Book", "The Lorax"]
                    })
    puzzles.push({ name: "Dr. Seuss Characters And Creatures",
                     category: "Literature",
                     words: ["Bingle Bug", "Blogg", "Bofa", "Cat in the Hat", "Chuggs", "Grinch", "Grox", "Happy Hunch", "Hilda Hen", "Little Cindy-Lou Who", "Lorax", "Ned", "Nink", "Red", "Sam I Am", "Thing One", "Thing Two", "Uncle Ubb", "Vipper of Vipp", "Waldo Woo", "Wocket", "Wumbus", "Yertle the Turtle", "Zizzer-zazzer-zuzz"]
                    })
    puzzles.push({ name: "Early American Authors",
                     category: "Literature",
                     words: ["Edgar Allan Poe", "Emily Dickinson", "Ernest Hemingway", "Frederick Douglass", "Henry David Thoreau", "Herman Melville", "Jack London", "John Steinbeck", "Kate Chopin", "Louisa May Alcott", "Mark Twain", "Nathaniel Hawthorne", "Ralph Waldo Emerson", "Robert Frost", "Stephen Crane", "Walt Whitman", "Washington Irving"]
                    })
    puzzles.push({ name: "English Authors",
                     category: "Literature",
                     words: ["Agatha Christie", "Alfred Tennyson", "Ben Jonson", "Charles Dickens", "Charlotte Bronte", "Christina Rossetti", "Christopher Marlowe", "Geoffrey Chaucer", "George Eliot", "Ian Fleming", "Jane Austen", "John Keats", "Lewis Carroll", "Lord Byron", "Mary Shelley", "Robert Browning", "Robert Graves", "Sir Walter Scott", "Virginia Woolf", "William Butler Yeats", "William Golding", "William Shakespeare"]
                    })
    puzzles.push({ name: "Greek Mythology",
                     category: "Literature",
                     words: ["Achilles", "Aphrodite", "Apollo", "Ares", "Artemis", "Athena", "Atropos", "Calypso", "Clotho", "Demeter", "Dionysus", "Hades", "Hector", "Helen", "Hephaestus", "Hera", "Heracles", "Icarus", "Jason", "Lachesis", "Midas", "Morpheus", "Odysseus", "Oedipus", "Pandora", "Persephone", "Poseidon", "Zeus"]
                    })
    puzzles.push({ name: "Grimm's Fairy Tales",
                     category: "Literature",
                     words: ["Bearskin", "Cinderella", "Hansel and Gretel", "Little Red-Cap", "Little Snow-White", "Rapunzel", "Rumpelstiltskin", "The Elves", "The Golden Bird", "The Golden Goose", "The Juniper-Tree", "The Queen Bee", "The Riddle", "The Shroud", "The Six Swans", "The Stolen Farthings", "The Three Feathers", "The True Sweetheart", "The Turnip", "The Water of Life", "The White Snake", "The Wise Servant", "Wise Folks"]
                    })
    puzzles.push({ name: "Hardy Boys Books",
                     category: "Literature",
                     words: ["The Clue in the Embers", "The Firebird Rocket   ", "The Haunted Fort", "The House on the Cliff", "The Jungle Pyramid", "The Melted Coins", "The Missing Chums", "The Tower Treasure"]
                    })
    puzzles.push({ name: "Jabberwocky",
                     category: "Literature",
                     words: ["bandersnatch", "beamish", "borogoves", "burbled", "callay", "callooh", "chortled", "frumious", "galumphing", "gimble", "gyre", "jubjub", "manxome", "mimsy", "mome", "outgrabe", "raths", "slithy", "snicker-snack", "toves", "tulgey", "tumtum", "uffish", "vorpal", "wabe"]
                    })
    puzzles.push({ name: "Jane Austen Characters",
                     category: "Literature",
                     words: ["Charlotte Lucas", "Colonel Brandon", "Colonel Brandon", "Edward Bertram", "Edward Ferrars", "Elinor Dashwood", "Elizabeth Bennett", "Emma Woodhouse", "Fanny Price", "Frank Churchill", "George Knightley", "Georgiana Darcy", "Jane Bennett", "John Willoughby", "Kitty Bennett", "Lady Lucas", "Lucy Steele", "Maria Lucas", "Marianne Dashwood", "Mary Bennett", "Rushworth", "Sir William Lucas"]
                    })
    puzzles.push({ name: "John Grisham Books",
                     category: "Literature",
                     words: ["A Painted House", "A Time To Kill", "Ford County", "Playing for Pizza", "Skipping Christmas", "The Appeal", "The Associate", "The Bleachers", "The Brethren", "The Broker", "The Chamber", "The Client", "The Confession", "The Firm", "The Innocent Man", "The King of Torts", "The Last Juror", "The Partner", "The Pelican Brief", "The Rainmaker", "The Runaway Jury", "The Street Lawyer", "The Summons", "The Testament"]
                    })
    puzzles.push({ name: "John Steinbeck",
                     category: "Literature",
                     words: ["A Russian Journal", "Bombs Away", "Cannery Row", "Cup of Gold", "East of Eden", "Flight", "In Dubious Battle", "In Touch", "Nothing so Monstrous", "Of Mice and Men", "Once There Was a War", "Sweet Thursday", "The Chrysanthemums", "The Gift", "The Grapes of Wrath", "The Long Valley", "The Moon is Down", "The Pearl", "The Red Pony", "The Wayward Bus", "To a God Unknown", "Tortilla Flat"]
                    })
    puzzles.push({ name: "Judy Blume Books",
                     category: "Literature",
                     words: ["Blubber", "Deenie", "Double Fudge", "Forever", "Freckle Juice", "Fudge-A-Mania", "Smart Women", "Summer Sisters", "Superfudge", "The Judy Blume Diary", "Tiger Eyes", "Wifey"]
                    })
    puzzles.push({ name: "Judy Blume Characters",
                     category: "Literature",
                     words: ["Farley Hatcher", "Glenn Garber", "Grandma Hatcher", "Henry Bevelheimer", "Herbie Garber", "Jeremy Dragon", "Jimmy Fargo", "Laura Danker", "Libby Tubman", "Linda Fischer", "Margaret Simon", "Moose Freed", "Mouse Ellis", "Nancy Wheeler", "Peter Hatcher", "Philip Leroy", "Rachel Robinson", "Sheila Tubman", "Sylvia Simon", "Tina Garber", "Tootsie Hatcher", "Tracy Wu", "Turtle", "Uncle Feather", "Winnie Barringer"]
                    })
    puzzles.push({ name: "Little House on The Prairie Books",
                     category: "Literature",
                     words: ["Bachelor Girl", "Farmer Boy", "On The Way Home", "On Tide Mill Lane", "The First Four Years", "The Long Winter", "The Road From Roxbury", "West From Home"]
                    })
    puzzles.push({ name: "Little House on The Prairie Characters",
                     category: "Literature",
                     words: ["Adam Kendall", "Adam Simms", "Alice Garvey", "Benjamin Cohen", "Caroline Ingalls", "Charles Ingalls", "Edna Cohen", "Eliza Wilder", "Giles Kendall", "Grace Edwards", "Isaiah Edwards", "John Carter", "Johnathan Garvey", "Kate Throvald", "Laura Ingalls Wilder", "Luke Simms", "Mary Ingalls Kendall", "Millie Wilder", "Nancy Oleson", "Nels Oleson", "Peter Lundstrom", "Rose Wilder", "Sarah Reed Carter", "Sterling Murdock", "Willie Oleson"]
                    })
    puzzles.push({ name: "Little Miss Books",
                     category: "Literature",
                     words: ["Little Miss Bossy", "Little Miss Brainy ", "Little Miss Busy", "Little Miss Contrary", "Little Miss Curious", "Little Miss Dotty", "Little Miss Fickle", "Little Miss Fun", "Little Miss Greedy", "Little Miss Helpful", "Little Miss Late", "Little Miss Lucky", "Little Miss Neat", "Little Miss Quick", "Little Miss Shy", "Little Miss Splendid", "Little Miss Star", "Little Miss Stubborn", "Little Miss Tidy", "Little Miss Tiny", "Little Miss Trouble", "Little Miss Wise"]
                    })
    puzzles.push({ name: "Lord of the Rings Characters",
                     category: "Literature",
                     words: ["Aragorn", "Arwen", "Bilbo Baggins", "Boromir", "Denethor", "Elendil", "Elrond", "Eowyn", "Faramir", "Fatty Bolger", "Frodo Baggins", "Galadriel", "Gandalf", "Gimli", "Gollum", "Legolas", "Merry Brandybuck", "Pippin Took", "Ringwraiths", "Samwise Gamgee", "Saruman", "Sauron", "The Balrog", "Treebeard", "Wormtongue"]
                    })
    puzzles.push({ name: "Lord of the Rings Places",
                     category: "Literature",
                     words: ["Bag End", "Barad Dur", "Black Gate", "Bree", "Dead Marshes", "Fangorn Forest", "Gondor", "Isengard", "Lothlorien", "Minas Tirith", "Mirror Of Galadriel", "Mordor", "Moria", "Pass of Caradhras", "Prancing Pony", "Rivendell", "River Anduin", "Rohan", "The Citadel", "The Shire", "Tower Of Orthanc"]
                    })
    puzzles.push({ name: "Max Lucado Books",
                     category: "Literature",
                     words: ["A Gentle Thunder", "A Heart Like Jesus", "A Love Worth Giving", "Everyday Blessings", "God Came Near", "Grace for the Moment", "He Chose The Nails", "He Still Moves Stones", "In The Eye of The Storm", "In The Grip of Grace", "Just Like Jesus", "Six Hours One Friday", "The Crippled Lamb", "Traveling Light", "When Christ Comes", "You Are Special"]
                    })
    puzzles.push({ name: "Men's Magazines",
                     category: "Literature",
                     words: ["Baseball Digest", "Black Belt", "Details", "ESPN the Magazine", "Esquire", "Euroman", "GQ", "Golf Digest", "Inside Sports", "Motor Trend", "New Man", "Outdoor Life", "Prime", "Sporting News", "Sports Illustrated", "The Chap"]
                    })
    puzzles.push({ name: "Mother Goose Characters",
                     category: "Literature",
                     words: ["Bobby Shaftoe", "Georgy Porgy", "Humpty Dumpty", "Jack", "Jack Horner", "Jack Sprat", "Jenny Wren", "Jill", "Jumping Joan", "Little Bo Peep", "Little Boy Blue", "Margery Daw", "Mary", "Miss Muffet", "Mother Hubbard", "Old King Cole", "Peter Piper", "Queen of Hearts", "Simple Simon", "Sulky Sue", "Three Blind Mice", "Thumbkin", "Tweedle-Dee", "Tweedle-Dum", "Wee Willie Winkie"]
                    })
    puzzles.push({ name: "Mrs. Piggle Wiggle",
                     category: "Literature",
                     words: ["Alison Burbank", "Anne Russell", "Bard Burbank", "Bobby Gray", "Darsie Burbank", "Dick Thompson", "Fetlock Harroway", "Hubert Prentiss", "Joan Russell", "Kitty Wheeling", "Larry Gray", "Patsy Waters", "Susan Gray", "The Not Truthful Cure", "The Radish Cure", "The Selfishness Cure", "The Tattletale Cure", "Timmy Hamilton", "Wendy Hamilton"]
                    })
    puzzles.push({ name: "Nancy Drew Books",
                     category: "Literature",
                     words: ["Buried Secrets", "Choosing Sides", "Crosscurrents", "Easy Marks", "False Moves", "Heart of Danger ", "Heart of Ice", "High Risk", "Hit and Run Holiday", "Island Of Secrets", "Last Dance", "Love Notes", "Mixed Signals", "Out of Bounds ", "Playing with Fire ", "Rich and Dangerous", "Stage Fright", "Stay Tuned for Danger ", "The Suspect Next Door", "The Wrong Chemistry ", "Trial by Fire", "Trouble in Tahiti", "Vanishing Act ", "White Water Terror "]
                    })
    puzzles.push({ name: "Newberry Medal Books",
                     category: "Literature",
                     words: ["A Single Shard", "A Year Down Yonder", "Criss-Cross", "Holes", "Kira-Kira", "Maniac Magee", "Missing May", "Number the Stars", "Out of the Dust", "Shiloh", "The Giver", "The Hero and the Crown", "Walk Two Moons", "Whipping Boy"]
                    })
    puzzles.push({ name: "Nicholas Sparks Books",
                     category: "Literature",
                     words: ["A Bend in the Road", "A Walk to Remember", "Allie", "Anna", "At First Sight", "Dear John", "Jane", "Jeremy", "John", "Lexie", "Message in A Bottle", "Nights in Rodanthe", "Noah", "Singer", "The Choice", "The Guardian", "The Last Song", "The Lucky One", "The Notebook", "The Rescue", "The Wedding", "Travis", "True Believer", "Veronica ", "Wilson"]
                    })
    puzzles.push({ name: "Nobel Prize Winners 1901-1930",
                     category: "Literature",
                     words: ["Anatole France", "Carl Spitteler", "Frederic Mistral", "George Bernard Shaw", "Gerhart Hauptmann", "Giosue Carducci", "Grazia Deledda", "Henri Bergson", "Henryk Sienkiewicz", "Jacinto Benavente", "Karl Gjellerup", "Knut Hamsun", "Maurice Maeterlinck", "Paul Heyse", "Rabindranath Tagore", "Romain Rolland", "Rudolf Eucken", "Rudyard Kipling", "Selma Lagerlof", "Sigrid Undset", "Sinclair Lewis", "Sully Prudhomme", "Theodor Mommsen", "Thomas Mann", "William Butler Yeats", "Wladyslaw Reymont"]
                    })
    puzzles.push({ name: "Nobel Prize Winners 1931-1960",
                     category: "Literature",
                     words: ["Albert Camus", "Andre Gide", "Bertrand Russell", "Boris Pasternak", "Erik Axel Karlfeldt", "Ernest Hemingway", "Francois Mauriac", "Gabriela Mistral", "Halldor Laxness", "Hermann Hesse", "Ivan Bunin", "John Galsworthy", "Juan Ramon Jiminez", "Luigi Pirandello", "Par Lagerkvist", "Pearl Buck", "Roger Martin du Gard", "Saint John Perse", "Salvatore Quasimodo", "William Faulkner", "Winston Churchill"]
                    })
    puzzles.push({ name: "Nobel Prize Winners 1961-1983",
                     category: "Literature",
                     words: ["Czeslaw Milosz", "Elias Canetti", "Eugenio Montale", "Eyvind Johnson", "Giorgios Seferis", "Harry Martinson", "Heinrich Boll", "Ivo Andric", "Jean-Paul Sartre", "John Steinbeck", "Mikail Sholokhov", "Nelly Sachs", "Odysseus Elytis", "Pablo Naruda", "Patrick White", "Samuel Beckett", "Saul Bellow", "Shmuel Agnon", "Vicente Aleixandre", "William Golding", "Yasunari Kawabata"]
                    })
    puzzles.push({ name: "Nobel Prize Winners 1984-2008",
                     category: "Literature",
                     words: ["Camilo Jose Cela", "Claude Simon", "Dario Fo", "Derek Walcott", "Doris Lessing", "Elfriede Jelinek", "Gao Zingjian", "Gunter Grass", "Harold Pinter", "Imre Kertesz", "Jaroslav Seifert", "Jose Saramago", "Joseph Brodsky", "Kenzaburo Oe", "Nadine Gordimer", "Naguib Mahfouz", "Octavio Paz", "Orhan Pamuk", "Seamus Heaney", "Toni Morrison", "Wislawa Szymborska", "Wole Soyinka"]
                    })
    puzzles.push({ name: "Science Fiction Books",
                     category: "Literature",
                     words: ["A Deepness in the Sky", "A Feast for Crows", "A Fire Upon the Deep", "Across Realtime", "Anathem", "Bones of the Earth", "Cosmonaut Keep", "Glasshouse", "Halting State", "Humans", "Iron Council", "Iron Sunrise", "Passage", "Rainbows End", "Rollback", "Singularity Sky", "Spin", "The Algebraist", "The Last Colony", "The Scar", "The Sky Road", "True Names"]
                    })
    puzzles.push({ name: "Stephen King Books",
                     category: "Literature",
                     words: ["Black House", "Carrie", "Cell", "Christine", "Cujo", "Desperation", "Dolores Claiborne", "Dreamcatcher", "Firestarter", "IT", "Insomnia", "Misery", "Rage", "Rose Madder", "The Dark Half", "The Dark Tower", "The Green Mile", "The Gunslinger", "The Running Man", "The Shining", "The Stand", "Thinner", "Tommyknockers"]
                    })
    puzzles.push({ name: "Sweet Valley High Books",
                     category: "Literature",
                     words: ["All Night Long", "Alone in the Crowd", "Broken Hearted", "Dangerous Love", "Dear Siser", "Decisions", "Double Love", "Happily Ever After", "Lost at Sea", "Love Letters", "Lovestruck", "Memories", "Playing With Fire", "Power Play", "Pretenses", "Secrets", "Slam Book Fever", "Stepsisters", "Taking Sides", "The Long-lost Brother", "The New Jessica", "The Parent Plot", "The Wedding", "White Lies"]
                    })
    puzzles.push({ name: "Sweet Valley Twins Books",
                     category: "Literature",
                     words: ["Amy Moves In", "Best Friends", "Booster Boycott", "Buried Treasure", "Choosing Sides", "First Place", "Haunted House", "Keeping Secrets", "Left Behind", "Lucy Takes the Reins", "Mary Is Missing", "Older Boy", "Princess Elizabeth", "Sneaking Out", "Standing Out", "Steven Gets Even", "Taking Charge", "The Bully", "The New Girl", "Todd Runs Away", "Tug Of War"]
                    })
    puzzles.push({ name: "Sweet Valley University Books",
                     category: "Literature",
                     words: ["Beauty And the Beach", "Breaking Away", "College Cruise", "College Girls", "Good-bye To Love", "Home For Christmas", "Love Me Always", "No Means No", "One Last Kiss", "Out of the Picture", "SS Heartbreak", "Shipboard Wedding", "Sneaking In", "Sorority Scandal", "Spy Girl", "The Boys of Summer", "The Love of Her Life", "The Price of Love", "The Truth About Ryan", "Undercover Angels"]
                    })
    puzzles.push({ name: "The Littles Books",
                     category: "Literature",
                     words: ["The Little Winner", "The Littles ", "The Littles Get Lost", "The Littles Help Out", "The Littles Move In", "The Littles Riddles", "The Littles Scouts"]
                    })
    puzzles.push({ name: "Types of Literature",
                     category: "Literature",
                     words: ["autobiography", "biography", "column", "editorial", "essay", "fable", "fairy tale", "fantasy", "fiction", "history", "journal", "memoir", "mystery", "myth", "non fiction", "novel", "novella", "poem", "romance", "satire", "science fiction", "script", "self-help", "short story", "text book"]
                    })
    puzzles.push({ name: "Vernor Vinge Books",
                     category: "Literature",
                     words: ["A Deepness in the Sky", "A Fire Upon the Deep", "Conquest By Default", "Gemstone", "Just Peace", "Long Shot", "Marooned in Realtime", "Original Sin", "Rainbows End", "The Accomplice", "The Ascent of Wonder", "The Blabber", "The Good New Stuff", "The Pece War", "The Science Fair", "The Ungoverned", "The Whirligig of Time", "The Wilting", "Visions of Wonder"]
                    })
    puzzles.push({ name: "Women's Magazines",
                     category: "Literature",
                     words: ["Allure", "Cosmogirl", "Cosmopolitan", "Elle", "Essence", "Fitness", "Glamour", "Good Housekeeping", "Health", "In Style", "Jane", "Lucky", "Marie Claire", "Modern Bride", "O Magazine", "Real Simple", "Redbook", "Self", "Shape", "Vogue"]
                    })
    puzzles.push({ name: "Algebra",
                     category: "Math",
                     words: ["average", "axes", "axioms", "binomial", "coefficient", "constant", "converse", "equation", "factor", "factor set", "formula", "inequality", "linear equation", "linear function", "monomial", "polynomial", "quotient", "ratio", "reciprocals", "slope of a line", "slope-intercept", "square root", "terms", "variable"]
                    })
    puzzles.push({ name: "Calculus",
                     category: "Math",
                     words: ["Constant Rule", "Hessian", "Power Rule", "antiderivative", "area", "derivative", "differentials", "directrix", "eccentricity", "focus", "function", "gradient", "infinity table", "isobars", "isotherms", "limit test", "logarithm", "maximum", "minimum", "paraboloid", "root test", "torque", "total differential", "unit vector", "work"]
                    })
    puzzles.push({ name: "Geometry",
                     category: "Math",
                     words: ["acute angle", "angle bisector", "bisector of segment", "center", "congruent angles", "convex", "diagonals", "diameter", "isosceles triangle", "line of symmetry", "obtuse angle", "parallel lines", "parallelogram", "perimeter", "perpendicular lines", "radius", "right angle", "scalene triangle", "sector", "sphere", "tangent line", "vertex"]
                    })
    puzzles.push({ name: "Graphs And Charts",
                     category: "Math",
                     words: ["Gantt", "Kagi", "Renko", "area", "bar", "box whisker", "bubble", "bubble", "candlestick", "column chart", "funnel", "high-low", "line", "log", "pie chart", "polar", "pyramid chart", "radar", "scatter plot", "smooth line", "stacked bar", "stem-and-leaf plot", "surface", "tape", "time series"]
                    })
    puzzles.push({ name: "Graphs And Charts Vocabulary",
                     category: "Math",
                     words: ["axis label", "coordinates", "data points", "data set", "domain", "grid", "grid line", "horizontal", "increment", "intercepts", "negative slope", "origin", "positive slope", "range", "scale", "slope", "values", "variables", "vertex", "vertical", "x-axis", "y-axis", "zero slope"]
                    })
    puzzles.push({ name: "Roman Numerals",
                     category: "Math",
                     words: ["II", "III", "IV", "IX", "VI", "VII", "VIII", "XI", "XII", "XIII", "XIV", "XIX", "XV", "XVI", "XVII", "XVIII", "XX", "XXI", "XXII", "XXIII", "XXIV", "XXV"]
                    })
    puzzles.push({ name: "Statistics",
                     category: "Math",
                     words: ["autocorrelation", "bias", "critical value", "discrete data", "experimental design", "extrapolation", "factorial design", "histogram", "hypothesis test", "interval scale", "matched samples", "mean", "median", "mode", "null hypothesis", "outcome", "probability", "range", "sample mean", "standard deviation", "test statistic", "unit", "variance"]
                    })
    puzzles.push({ name: "Airforce Bases International",
                     category: "Military",
                     words: ["Araxos", "Aviano", "Burgas", "Dhahran", "Einsiedlerhof", "Ghedi", "Incirlik", "Izmir", "Jeddah", "Kuwait IAP", "Lajes Field", "Masirah", "Mostar", "Prince Sultan", "RAF Alconbury", "RAF Fairford", "RAF Lakenheath", "RAF Mildenhall", "RAF Upwood", "Ramstein", "Seeb", "Sembach", "Stavanger", "Tabuk", "Taszar"]
                    })
    puzzles.push({ name: "Marine Corps And Coast Guard",
                     category: "Military",
                     words: ["Beaufort MCAS", "CG Headquarters", "Camp Lejeune", "Camp Pendelton", "Cape May CG", "Cherry Point MCAS", "Elizabeth City CG", "Henderson Hall", "MCAS Miramar", "MCAS YUMA", "Marine Barracks", "New River MCAS", "USCG Hampton Roads"]
                    })
    puzzles.push({ name: "Naval Leaders",
                     category: "Military",
                     words: ["Alfred von Tirpitz", "Bertram Ramsay", "Chester Nimitz", "George Anson", "George Dewey", "George Rodney", "Horatio Nelson", "Isoroku Yamamoto", "John Jellicoe", "John Paul Jones", "Karl Doenitz", "Marc Mitscher", "Michiel de Ruyter", "Ray Spruance", "Samuel Pepys", "Sir David Beatty", "Sir Francis Drake", "Sir Henry Morgan", "Stephen Decatur", "Togo Heihachiro", "William Bligh", "Yi Sun-sin"]
                    })
    puzzles.push({ name: "US Military Ranks",
                     category: "Military",
                     words: ["Admiral", "Brigadier General", "Captain", "Colonel", "Commander", "Commodore", "Corporal", "First Sergeant", "General", "Lieutenant", "Lieutenant Colonel", "Lieutenant General", "Major", "Major General", "Master Sergeant", "Private", "Private First Class", "Sergeant", "Specialist", "Staff Sergeant", "Warrant Officer"]
                    })
    puzzles.push({ name: "United States Airforce Bases",
                     category: "Military",
                     words: ["Andrews", "Barksdale", "Beale", "Cannon", "Charleston", "Creech", "Dover", "Dyess", "Ellsworth", "Fairchild", "Grand Forks", "Holloman", "Langley", "Laughlin", "Little Rock", "Minot", "Moody", "Nellis", "Pope", "Scott", "Shaw", "Sheppard", "Travis", "Vance", "Whiteman"]
                    })
    puzzles.push({ name: "United States Army Bases",
                     category: "Military",
                     words: ["Fort Benning", "Fort Bragg", "Fort Campbell", "Fort Carson", "Fort Gillem", "Fort Gordon", "Fort Huachuca", "Fort Irwin", "Fort Knox", "Fort Leavenworth", "Fort McNair", "Fort McPherson", "Fort Polk", "Fort Richardson", "Fort Riley", "Fort Rucker", "Fort Shafter", "Fort Stewart", "Fort Wainwright", "Hunter Army Airfield", "Presidio of Monterey", "Redstone Arsenal", "Schofield Barracks"]
                    })
    puzzles.push({ name: "United States Navy Bases",
                     category: "Military",
                     words: ["Annapolis NS", "Atlanta NAS", "Brunswick NAS", "Corpus Christi NAS", "Fallon NAS", "Jacksonville NAS", "Key West NAS", "Lemoore NAS", "Naval Base Coronado", "Naval Base Point Loma", "North Island NAS", "Patuxent River NAS", "Pensacola NAS", "Point Mugu NAS", "San Diego NS", "Santa Clara NAS", "Washington NS", "Washington Navy Yard"]
                    })
    puzzles.push({ name: "Auto Shop Tools",
                     category: "Tools",
                     words: ["air compressor", "air hose", "battery charger", "blow gun", "buffer", "drill", "extractors", "file", "flashlight", "grinder", "jack", "jack stand", "jumper cables", "lift", "pliers", "pry bar", "ratchet", "sander", "scraper", "socket", "welder", "wheel balancer", "wrench"]
                    })
    puzzles.push({ name: "Baskin Robbins Ice Cream",
                     category: "Miscellaneous",
                     words: ["Cherries Jubilee", "Chocolate", "Chocolate Fudge", "Daiquiri Ice", "Gold Medal Ribbon", "Icing on the Cake", "Jamoca", "Jamoca Almond Fudge", "Mint Chocolate Chip", "Nutty Coconut", "Pink Bubblegum", "Pistachio Almond", "Rainbow Sherbet", "Rocky Road", "Superfudge Truffle", "Vanilla", "Watermelon Chip"]
                    })
    puzzles.push({ name: "Ben & Jerry's Ice Cream",
                     category: "Miscellaneous",
                     words: ["Americone Dream", "Banana Split", "Boston Cream Pie", "Brownie Batter", "Buried Treasure", "Cake Batter", "Cheesecake Brownie", "Cherry Garcia", "Chocolate Macadamia ", "Chubby Hubby", "Chunky Monkey", "Cinnamon Buns", "Creme Brulee", "Dublin Mudslide", "Dulce Delish", "Fossil Fuel", "Half Baked", "Jamaican Me Crazy", "Maple Blondie", "Neopolitan Dynamite", "Phish Food", "Pumpkin Cheesecake", "Turtle Soup"]
                    })
    puzzles.push({ name: "Boy Scout Badges",
                     category: "Miscellaneous",
                     words: ["Archaeology", "Archery", "Auto Mechanics", "Aviation", "Backpacking", "Botany", "Camping", "Canoeing", "Engineering", "Farm Mechanics", "First Aid", "Fishing", "Forestry", "Geology", "Indian Lore", "Journalism", "Law", "Masonry", "Music", "Nature", "Oceanography", "Pioneering", "Rowing", "Whitewater", "Woodwork"]
                    })
    puzzles.push({ name: "Children's Clothing Stores",
                     category: "Miscellaneous",
                     words: ["Abercrombie", "Anna-Bean Clothing", "BabyGap", "BabyUniverse", "Babystyle", "Bunny Creek", "Garnet Hill", "Gymboree", "Hanna Anderson", "Hartstrings", "Hatley", "Janie and Jack", "Justice", "LittleMissMatched", "Old Navy", "One Step Ahead", "Pinky Scout", "Pumpkin Patch", "The Kids Window", "TinyTotDressShop", "Tutti Bella"]
                    })
    puzzles.push({ name: "Children's Games",
                     category: "Miscellaneous",
                     words: ["Battleship", "Candyland", "Chinese jump rope", "Chutes and Ladders", "Connect Four", "Cootie", "Duck Duck Goose", "Four Square", "Heads Up", "Hi Ho Cherry-O", "Hopscotch", "Hungry Hungry Hippos", "Jacks", "Mancala", "Marbles", "Monopoly", "Operation", "Red Rover", "Simon Says", "Sorry", "Tag", "Trouble", "Uno", "jump rope"]
                    })
    puzzles.push({ name: "Colleges And Universities",
                     category: "Miscellaneous",
                     words: ["Amherst", "Baylor", "Brigham Young", "Brown", "Bucknell", "Columbia", "Cornell", "Dartmouth", "Duke", "Florida", "Georgetown", "Harvard", "Howard", "Johns Hopkins", "Loyola", "Notre Dame", "Reed", "Rutgers", "Stanford", "Syracuse", "Tulane", "UCLA", "Vanderbilt", "Whitman", "Yale"]
                    })
    puzzles.push({ name: "Computer Fonts",
                     category: "Miscellaneous",
                     words: ["algerian", "arial", "broadway", "campria", "coronet", "courier", "formata", "futura", "geneva", "impact", "lithos", "marigold", "monaco", "onyx", "oxford", "palatino", "papyrus", "quake", "renault", "rockwell", "rotunda", "times new roman", "times roman", "verdana", "westminster"]
                    })
    puzzles.push({ name: "Elementary School",
                     category: "Miscellaneous",
                     words: ["Back to School Night", "alphabet", "art projects", "backpack", "bell", "books", "cafeteria", "chalk", "classroom", "conferences", "crayons", "crossing guard", "desk", "erasers", "field trips", "flag salute", "folders", "homework", "library", "lunch box", "paint", "paste", "pencils", "playground", "recess"]
                    })
    puzzles.push({ name: "Games",
                     category: "Miscellaneous",
                     words: ["Balderdash", "Bunko", "Chinese checkers", "Cranium", "Dominoes", "Jenga", "Mastermind", "Othello", "Outburst", "Pac-Man", "Parcheesi", "Pictionary", "Pitfall", "Scattergories", "Scrabble", "Sudoku", "Trivial Pursuit", "Wii Fit", "Wii Sports", "bingo", "checkers", "chess", "crossword", "word search"]
                    })
    puzzles.push({ name: "Girl Scout Badges",
                     category: "Miscellaneous",
                     words: ["Aerospace", "Architecture", "Careers", "Caring for Children", "Communication", "Community", "Dance", "Earth Connections", "Fabric Arts", "Family Living", "Field Sports", "Global Awareness", "Graphics", "Health", "Heritage", "Music", "Outdoors", "Pet Care", "Plants and Animals", "Safety", "Science", "Sewing", "Wildlife", "World Neighbors"]
                    })
    puzzles.push({ name: "Hats",
                     category: "Miscellaneous",
                     words: ["Balmoral", "Baseball Cap", "Beanie", "Beret", "Boonie", "Bowler", "Bucket", "Capuchon", "Cloche", "Cowboy", "Fedora", "Fez", "Indian Pith Helmet", "Jaxon Cossack", "Newsboy Cap", "Panama", "Porkpie", "Straw", "Top", "Toque", "Trilby", "Visor", "Yarmulke"]
                    })
    puzzles.push({ name: "Hobbies",
                     category: "Miscellaneous",
                     words: ["bird watching", "collecting", "crafts", "crocheting", "cycling", "fishing", "gardening", "golf", "hiking", "hunting", "knitting", "painting", "photography", "pottery", "quilting", "running", "sailing", "sewing", "skiing", "snowboarding", "surfing", "tennis", "traveling", "woodworking", "writing"]
                    })
    puzzles.push({ name: "Jackets",
                     category: "Miscellaneous",
                     words: ["anorak", "blazer", "bolero", "car coat", "corduroy", "denim", "dinner", "duster coat", "field jacket", "frock coat", "lab coat", "leather", "letterman jacket", "life jacket", "motorcycle jacket", "pea coat", "puffer", "quilted", "raincoat", "sportcoat", "straight jacket", "suede", "tailcoat", "trench coat", "windbreaker"]
                    })
    puzzles.push({ name: "Men's Clothing Stores",
                     category: "Miscellaneous",
                     words: ["Banana Republic", "Bass", "Big Dogs", "Brooks Brothers", "Calvin Klein", "Dickies", "Eddie Bauer", "Gap", "Hollister", "Izod", "Kasper", "Kenneth Cole", "Lacoste", "Orvis", "Paragon Sports", "Paul Frederick", "REI", "Timberland", "Vans"]
                    })
    puzzles.push({ name: "Middle/High School",
                     category: "Miscellaneous",
                     words: ["after school sports", "assembly", "band practice", "calculator", "cheer practice", "choir ", "clubs", "coach", "computer", "detention", "guidance counselor", "gym", "hall monitor", "hall pass", "homeroom", "lab", "locker", "permission slip", "prom", "quiz", "report card", "safety patrol", "study hall", "test"]
                    })
    puzzles.push({ name: "Mobile Network Operators",
                     category: "Miscellaneous",
                     words: ["BSNL", " T-Mobile", " Tata Teleservices", " Telenor", " Turkcell", " Verizon Wireless", " Vodafone", "Airtel", "Axiata Group Berhad", "China Mobile", "China Telecom", "China Unicom", "Etisalat", "MTN Group", "MTS", "Orange", "SingTel", "TeliaSonera", "Telkomsel", "VimpelCom"]
                    })
    puzzles.push({ name: "Newspaper Terms",
                     category: "Miscellaneous",
                     words: ["Advertisment ", "Assignment", "Associated Press ", "Banner ", "Beat", "Body Copy ", "Broadsheet", "Byline", "Caption ", "Circulation", "Columnist", "Copy Editor ", "Correspondent", "Credit Line ", "Deadline", "Editorial", "Feature", "Masthead ", "Newsstand", "Press Run ", "Proofreader ", "Scoop", "Stringer ", "Tabloid", "Typo"]
                    })
    puzzles.push({ name: "Pairs",
                     category: "Miscellaneous",
                     words: ["binoculars", "bookends", "earrings", "eyes", "glasses", "gloves", "goggles", "jeans", "jumper cables", "legs", "mittens", "overalls", "pants", "pliers", "scissors", "shoelaces", "shoes", "shorts", "skates", "socks", "stockings", "sunglasses", "tights", "tongs", "underwear"]
                    })
    puzzles.push({ name: "Pants",
                     category: "Miscellaneous",
                     words: ["athletic", "boot cut", "capris", "cargo", "carrot", "cigarette", "clam diggers", "cropped", "flare", "gauchos", "harem", "high waisted", "jeans", "khakis", "low rise", "mid rise", "palazzos", "pleated", "skinny", "slacks", "sweats", "trousers", "wide leg", "wool", "yoga"]
                    })
    puzzles.push({ name: "Peanuts Characters",
                     category: "Miscellaneous",
                     words: ["Andy", "Belle", "Charlie Brown", "Franklin", "Frieda", "Harriet", "Joe Cool", "Lila", "Linus", "Lucy", "Marbles", "Marcie", "Molly", "Olaf", "Peppermint Patty", "Pig-Pen", "Rover", "Sally", "Schroeder", "Snoopy", "Spike", "The Great Pumpkin", "The Red Baron", "Violet ", "Woodstock"]
                    })
    puzzles.push({ name: "Plus Size Clothing Stores",
                     category: "Miscellaneous",
                     words: ["Addition Elle", "Apple Bottoms", "Avenue", "Baby Phat", "CJ Banks", "Catherines", "Curvaceous Chic", "Fashion Bug", "IGIGI", "Jessica London", "Just For Curves", "Kiyonna", "Lane Bryant", "Old Navy", "Silhouettes", "Size Appeal", "Soft Surroundings", "Torrid", "Ulla Popken", "Woman Within"]
                    })
    puzzles.push({ name: "School Subjects",
                     category: "Miscellaneous",
                     words: ["Algebra", "Art", "Auto mechanics", "Biology", "Calculus", "Chemistry", "Composition", "Drafting", "Drama", "Earth Science", "English", "French", "Geography", "Government", "Health", "Home Economics", "Language Arts", "Latin", "Metal Shop", "Physical Education", "Physics", "Social Studies", "Spanish", "Trigonometry"]
                    })
    puzzles.push({ name: "Shoe Stores",
                     category: "Miscellaneous",
                     words: ["Adidas", "Aerosoles ", "Boot Barn", "Converse", "Easy Spirit", "Famous Footwear", "Fila", "Florsheim", "Foot Locker", "Journeys", "Onlineshoes", "Payless Shoe Source", "Puma", "Rockport", "Shoe Pavilion", "Shoes", "Skechers", "Steve Madden", "Stride Rite", "Teva", "The Walking Company", "Timberland", "Ugg Australia", "Wissota Trader", "Zappos"]
                    })
    puzzles.push({ name: "Shoes",
                     category: "Miscellaneous",
                     words: ["Mary Janes", "T-straps", "ankle straps", "athletic", "boat shoes", "booties", "boots", "clog", "espadrilles", "flats", "flip flop", "loafers", "moccasins", "mule", "oxfords", "peep toe", "platform", "pumps", "sandal", "skimmer", "slingback", "slipper", "sneaker", "stilettos", "wedge"]
                    })
    puzzles.push({ name: "Solitaire Card Games",
                     category: "Miscellaneous",
                     words: ["Agnes", "Black Widow", "Blind Alleys", "Carlton", "Cone", "Curds and Whey", "Double Scorpion", "Downhill", "Eight Off", "Free Cell", "Harp", "Kingsley", "Klondike", "Open Scorpion", "Open Spider", "Penguin", "Raglan", "Saratoga", "Scarf", "Seahaven Towers", "Spider Solitaire", "Three Blind Mice", "Victoria", "Wasp", "Whitehead"]
                    })
    puzzles.push({ name: "Summer Mocktails",
                     category: "Miscellaneous",
                     words: ["Apple Julep", "Apple Karate", "Apple Spider", "Apricot Appealer", "Beachcomber", "Berry Sweetheart", "Bora Bora", "Cherry Fizz", "Citrus Mint Cooler", "Cran-Dandy Cooler", "Grapefruit Lemonade", "Italian Cream Soda", "Lime Cola", "Lucky Driver", "Melon Ice", "Michigan Fizz", "Pineapple Power", "Quiet Passion", "Shirley Temple", "Spiced Tomato Juice", "Sunny Citrus Cooler", "Tornado Twist", "Tricky Mary"]
                    })
    puzzles.push({ name: "Women's Clothing Stores",
                     category: "Miscellaneous",
                     words: ["Ann Taylor", "Ann Taylor Loft", "Anne Klein", "Anthropologie", "Banana Republic", "Bebe", "Charlotte Russe", "Coldwater Creek", "Esprit", "Express", "Gap ", "Guess", "Jones New York", "Max Studio", "Newport News", "Old Navy", "Talbots", "The Limited", "Wet Seal"]
                    })
    puzzles.push({ name: "Wood Shop Tools",
                     category: "Tools",
                     words: ["band saw", "bolt", "chisel", "clamp", "drill bit", "drill press", "file", "glue", "hammer", "jig saw", "jointer", "lathe", "level", "miter", "nail", "plane", "router", "router table", "sander", "screw", "screw driver", "table saw", "tape measure", "triangle", "vice"]
                    })
    puzzles.push({ name: "Animal Names Male And Female",
                     category: "Nature",
                     words: ["billy", "boar", "buck", "bull", "cock", "cow", "doe", "drone", "ewe", "gander", "goose", "hen", "jenny", "lion", "lioness", "mare", "nanny", "queen", "ram", "rooster", "sow", "stag", "stallion", "stud", "tom"]
                    })
    puzzles.push({ name: "Australian Animals",
                     category: "Nature",
                     words: ["Bandicoot", "Bilby", "Brown Snake", "Crocodile", "Cuscus", "Dingo", "Dugong", "Echidna", "Emu", "Galah", "Ghost Bat", "Kangaroo", "Koala", "Kookaburra", "Numbat", "Platypus", "Possum", "Quokka", "Rainbow Lorikeet", "Sand Monitor", "Sugar Glider", "Taipan", "Tasmanian Devil", "Wallaby", "Wombat"]
                    })
    puzzles.push({ name: "Baby Animals",
                     category: "Nature",
                     words: ["bunny", "calf", "chick", "colt", "cub", "duckling", "eaglet", "fawn", "flapper", "fledgling", "fly", "foal", "gosling", "hatchling", "joey", "kid", "kitten", "lamb", "nestling", "owlet", "piglet", "polliwog", "pup", "tadpole", "yearling"]
                    })
    puzzles.push({ name: "Bryce Canyon National Park",
                     category: "Nature",
                     words: ["Bryce Amphitheater", "Bryce Point", "Corral Hollow", "Fairyland Loop Trail", "Geology Hike", "Hat Shop Trail", "Inspiration Point", "Iron Spring", "Long Hollow", "Mossy Cave Trail", "Natural Bridge", "Rainbow Point", "Riggs Spring", "Rim Walk", "Sheep Creek", "Sunset Point", "Swamp Canyon", "Swamp Canyon Butte", "Under the Rim Trail", "Whiteman Bench", "Yellow Creek ", "Yovimpa Pass"]
                    })
    puzzles.push({ name: "Butterflies And Moths",
                     category: "Nature",
                     words: ["American Snout", "Blue Morpho", "Brimstone", "Cabbage White", "Garden Tiger Moth", "Goliath Birdwing", "Julia", "Luna Moth", "Monarch", "Mourning Cloak", "Painted Lady", "Peacock", "Postman", "Red Admiral", "Saturn", "Snout Moth", "Southern Dogface", "Spring Azure", "Summer Azure", "Tiger Swallowtail", "Ulysses", "Viceroy", "Zebra Swallowtail"]
                    })
    puzzles.push({ name: "Coral Reef",
                     category: "Nature",
                     words: ["Acropora", "Apo Reef", "Belize Barrier Reef", "Coral Sea Islands", "Lyra Reef", "Madrepore", "Maro Reef", "anemones", "apron reef", "atoll", "bank reef", "barrier reef", "black-band disease", "cnidarians", "coral bleaching", "coral polyps", "fringing reef", "hermatypic coral", "jellyfish", "medical treatment", "patch reef", "platform reef", "ribbon reef", "table reef", "wave erosion"]
                    })
    puzzles.push({ name: "Death Valley National Park",
                     category: "Nature",
                     words: ["Badwater Salt Flat", "Daylight Pass Road", "Death Valley Buttes", "Desolation Canyon", "Fall Canyon", "Furnace Creek", "Golden Canyon", "Gower Gulch Loop", "Klare Springs", "Little Bridge Canyon", "Mosaic Canyon", "Stovepipe Wells", "Titus Canyon Narrows", "Ubehebe Crater", "Wildrose Peak Trail", "Zabriskie Point"]
                    })
    puzzles.push({ name: "Everglades National Park",
                     category: "Nature",
                     words: ["Ernest Coe", "Flamingo District", "Flamingo Marina", "Flamingo Trails", "Florida Bay", "Gulf Coast District", "Gulf Coast Trails", "Halfway Creek", "Homestead", "Key Largo", "Little Rabbit Key", "Long Pine Key Trails", "North Nest Key ", "Observation Tower", "Pine Glades Lake", "Pine Island Trails", "Royal Palm", "Sandfly Island", "Shark Valley Trails", "Tram Road", "Turner River"]
                    })
    puzzles.push({ name: "Fish",
                     category: "Nature",
                     words: ["angelfish", "bass", "bluegill", "bonito", "carp", "catfish", "grouper", "guppy", "haibut", "loach", "mackerel", "mahi-mahi", "marlin", "mullet", "rockfish", "roughy", "salmon", "swordfish", "tilapia", "tilefish", "trout", "tuna", "wahoo", "walleye", "yellowtail"]
                    })
    puzzles.push({ name: "Glacier National Park",
                     category: "Nature",
                     words: ["Ahern Pass", "Apgar Campground", "Avalanche Gorge", "Bowman Lake", "Cedars Nature Trail", "Fishcreek", "Goat Haunt", "Going-to-the-Sun Road", "Granite Park", "Hidden Lake", "Hole in the Wall", "Kintla Lake", "Lake McDonald", "Logan Creek", "Many Glacier", "North Fork", "Rising Sun", "Running Eagle Falls", "Sherburne Lake", "Sprague Creek", "Two Medicine", "Waterton Lake"]
                    })
    puzzles.push({ name: "Grand Canyon National Park",
                     category: "Nature",
                     words: ["Arizona Trail", "Bright Angel Trail", "Cape Final", "Cape Royal Road", "Cliff Springs", "Coconino Overlook", "Colorado River", "Grand Canyon Lodge", "Grandview Point", "Grandview Trail", "Hermit Trail", "Hermits Rest", "Horseshoe Mesa", "Ken Patrick Trail", "Point Imperial", "Rim Trail", "Roaring Springs", "Roosevelt Point", "Santa Maria Spring", "South Kaibab Trail", "Supai Tunnel", "Uncle Jim Trail", "Widforss Trail", "Yaki Point"]
                    })
    puzzles.push({ name: "Grand Teton National Park",
                     category: "Nature",
                     words: ["Antelope Flats Road", "Blacktail Ponds", "Cascade Canyon", "Colter Bay", "Death Canyon", "Flagg Ranch", "Granite Canyon", "Inspiration Point", "Jackson Hole", "Jackson Lake", "Jenny Lake", "Lizard Creek", "Lupine Meadows", "Moose Junction", "Mormon Row", "Oxbow Bend", "Signal Mountain", "Snake River", "String Lake", "Teton Range", "The Teton Park Road", "Timbered Island"]
                    })
    puzzles.push({ name: "Joshua Tree National Park",
                     category: "Nature",
                     words: ["Belle", "Black Rock", "Black Rock Canyon", "California Juniper", "Cottonwood Spring", "Covington Flats", "Desert Almond", "Desert Willow", "Eureka Peak", "Hidden Valley", "Indian Cove", "Jumbo Rocks", "Keys View", "Mastodon Mine", "Mastodon Peak", "Mesquite", "Mojave Yucca", "Ryan", "Skull Rock", "Smoketree", "White Tank", "Winona Mill Site", "fan palm oases"]
                    })
    puzzles.push({ name: "Kings Canyon Sequoia National Park",
                     category: "Nature",
                     words: ["Atwell", "Azalea", "Azalea Trail", "Boone Meadow", "Bubbs Creek", "Buckeye Flat", "Canyon View", "Cedar Grove", "Crystal Springs", "Dorst", "General Grant Tree ", "Grant Grove", "Kings River", "Lodgepole", "Mist Falls", "Moraine", "Moro Rock", "Paradise Valley", "Potwisha", "Roads End", "Sentinel", "Sheep Creek", "South Fork", "Sunset", "Zumwalt Meadow"]
                    })
    puzzles.push({ name: "Mount Ranier National Park",
                     category: "Nature",
                     words: ["Carbon River", "Christine Falls", "Cougar Rock", "Glacier Bridge", "Green Lake Trail", "Ipsut Creek", "Mowich Lake", "Narada Falls", "Nisqually Glacier", "Ohanapecosh", "Paradise", "Paradise Inn", "Shadow Lakes Trail", "Silver Falls Trail", "Sunshine Point", "Tatoosh Range", "The Guide House", "The Longmire Museum", "Tipsoo Lake", "Tolmie Peak Trail", "Trail of the Shadows", "Westside Road", "White River"]
                    })
    puzzles.push({ name: "Natural Remedies",
                     category: "Nature",
                     words: ["Aloe", "Bilberry", "Black Cohosh", "Blue Cohosh", "Calcium", "Chamomile", "Chromium", "Cinnamon", "Dandelion", "Elderberry", "Fenugreek", "Fish Oil", "Flaxseed", "Ginger", "Goldenrod", "Horsetail", "Iodine", "Iron", "Juniper Berry", "Kelp", "Melatonin", "Potassium", "Saw Palmetto", "Tumeric"]
                    })
    puzzles.push({ name: "Redwood National Park",
                     category: "Nature",
                     words: ["Bald Hills Road", "Cal-Barrel Road", "Coastal Drive", "Coastal Trail", "Davison Road", "Davison Trail", "Elk Prairie", "Enderts Beach Road", "Fern Canyon", "Flint Ridge", "Gold Bluffs Beach", "Hidden Beach", "Howland Hill Road", "Jedidiah Smith", "Lagoon Creek", "Lost Man Creek Trail", "Mill Creek", "Orick Horse Trail", "Ossagon Trail Loop", "Redwood Creek", "Requa Road", "Tall Trees Grove"]
                    })
    puzzles.push({ name: "Types Of Wood",
                     category: "Nature",
                     words: ["Acacia", "Alder", "Balsa", "Bamboo", "Boxwood", "Brazilwood", "Butternut", "Cherry", "Cork", "Dogwood", "Driftwood", "Ebony", "Ironwood", "Kingwood", "Linden", "Madrone", "Mesquite", "Palmwood", "Purpleheart", "Rosewood", "Sandalwood", "Satinwood", "Snakewood", "Teak", "Zebrawood"]
                    })
    puzzles.push({ name: "Types of Grains and Grasses",
                     category: "Nature",
                     words: ["alfalfa", "bamboo", "barley", "bent grass", "bermuda grass", "blue grass", "buckwheat", "bulrush", "corn", "crab grass", "horsetail", "maize", "millet", "oats", "redtop", "reed", "rice", "rye", "sedge", "sedge", "sesame", "star grass", "sugar cane", "wheat", "wire grass"]
                    })
    puzzles.push({ name: "Types of Shells",
                     category: "Nature",
                     words: ["Alphabet Cone", "Apple Murex", "Atlantic Bubble", "Beaded Periwinkle", "Fighting Conch", "Florida Cerith", "Florida Cone", "Horse Conch", "Jingles", "Jujube Top-shell", "Junonia", "Lace Murex", "Lettered Olive", "Nutmeg", "Paper Fig", "Pear Whelk", "Scotch Bonnet", "Shark Eye", "Slipper Shell", "Spiny Jewel Box", "True Tulip", "Turkey Wing", "Worm Seashell"]
                    })
    puzzles.push({ name: "Yellowstone National Park",
                     category: "Nature",
                     words: ["Bunsen Peak", "Canyon", "Canyon Village", "Craig Pass", "Firehole River", "Howard Eaton Trail", "Kite Hill Cemetery", "Lake Village", "Madison", "Mammoth", "Mammoth Hot Springs", "Old Faithful", "Old Faithful Lodge", "Pleasant Valley", "Roosevelt Arch", "Scottish Rite Chapel", "Sylvan Pass", "The Bannock Trail", "The Buffalo Ranch", "Tower-Roosevelt"]
                    })
    puzzles.push({ name: "Yosemite National Park",
                     category: "Nature",
                     words: ["Badger Pass", "Bridalveil Fall", "Cathedral Rocks", "Eagle Peak", "El Capitan", "El Portal View", "Glacier Point", "Half Dome", "Lower Brother", "Lower Yosemite Fall", "Middle Brother", "Nevada Fall", "Olmsted Point", "Ribbon Fall", "Sentinel Rock", "The Ahwahnee", "The Three Brothers", "Tunnel View", "Tuolumne Meadows", "Vernal Fall", "Wawona", "Yosemite Chapel", "Yosemite Falls"]
                    })
    puzzles.push({ name: "Zion National Park",
                     category: "Nature",
                     words: ["Angels Landing", "Big Bend", "Canyon Junction", "Canyon Overlook", "Goose Creek", "Hidden Canyon", "Kolob Arch", "Lower Emerald Pools", "Middle Emerald Pools", "Orderville Canyon", "Pine Creek", "Riverside Walk", "Taylor Creek", "Temple Of Sinawava", "The Grotto", "The Subway", "The Virgin River", "Watchman", "Weeping Rock", "Wildcat Trail", "Zion Canyon", "Zion Narrows", "Zion Rock"]
                    })
    puzzles.push({ name: "Camping",
                     category: "Outdoor Activities",
                     words: ["backpack", "bear", "camper", "campfire", "campground", "canoe", "compass", "fishing", "flashlight", "forest", "hiking", "hiking boots", "lantern", "marshmallows", "mosquitoes", "mountain", "nature", "pine cones", "pine needles", "sleeping bag", "streams", "tent", "tent stake", "trail", "trees"]
                    })
    puzzles.push({ name: "Outdoor Recreation",
                     category: "Outdoor Activities",
                     words: ["archery", "badminton", "bocce ball", "canoeing", "cricket", "croquet", "fishing", "golf", "hiking", "horseback riding", "hunting", "kayaking", "lacrosse", "rock climbing", "rodeo", "rollerblading", "rowing", "rugby", "running", "sailing", "scuba diving", "skateboarding", "skiing", "skydiving", "snowboarding"]
                    })
    puzzles.push({ name: "Rock Climbing",
                     category: "Outdoor Activities",
                     words: ["RVR", "acclimate", "aider", "arete", "bail", "belaying", "bivy", "carabiner", "crimp", "deck", "declivity", "fissure", "flake", "greenpoint", "hangdog", "jamming", "manky", "muddling", "pendulum", "piton", "rappelling", "runner", "sit harness", "sprong", "top roping"]
                    })
    puzzles.push({ name: "Baby Brand Names",
                     category: "Parties and Events",
                     words: ["Avent", "Baby Bjorn", "Baby Einstein", "Baby Trend", "Boppy", "Britax", "Bumbo", "Bumpkins", "Chicco", "Cocalo", "Evenflo", "Fisher Price", "Gerber", "Graco", "Huggies", "Infantino", "Kolcraft", "Lamaze", "Pampers", "Sassy", "Tiny Love"]
                    })
    puzzles.push({ name: "Baby Gear",
                     category: "Parties and Events",
                     words: ["blankets", "bottles", "bouncer", "bumper pads", "burp cloths", "car seat", "carrier", "changing table", "crib", "diaper bag", "diapers", "formula", "gate", "high chair", "monitor", "onesies", "pacifier", "playard", "sling", "stroller", "swing", "teethers", "towels", "walker", "washcloths"]
                    })
    puzzles.push({ name: "Baby Shower",
                     category: "Parties and Events",
                     words: ["adorable", "baby powder", "baby talk", "bibs", "blanket", "bonnet", "booties", "bottle", "car seat", "cooing", "crib", "cute", "daddy", "diaper bag", "diapers", "family", "giggles", "high chair", "love", "milk", "mommy", "nap time", "pacifier", "rattle", "stroller", "teething ring"]
                    })
    puzzles.push({ name: "Back to School",
                     category: "Parties and Events",
                     words: ["I cooked dinner", "I did my homework", "I played basketball", "I played sports", "I rode a horse", "I took summer school", "I volunteered", "I went camping", "I went fishing", "I went on vacation", "I went out of state", "I went out of town", "I went overseas", "I went swimming", "I went to a museum", "I went to a wedding", "I went to summer camp", "I went to the beach", "I went to the library", "I went to the zoo"]
                    })
    puzzles.push({ name: "Wedding Dress Designers",
                     category: "Parties and Events",
                     words: ["Alberta Ferretti", "Alfred Angelo", "Amsale", "Ana Cristache", "Carolina Herrera", "David Fielden", "Demetrios", "Elizabeth Fillmore", "Faviana", "Jenny Packham", "Justin Alexander", "Karelina Sposa", "Maggie Sottero", "Manuel Mota", "Melissa Sweet", "Mon Cheri", "Monique Lhuillier", "Nicole Miller", "Oleg Cassini", "Oscar de la Renta", "Sassi Holford", "Vera Wang"]
                    })
    puzzles.push({ name: "Wedding Songs",
                     category: "Parties and Events",
                     words: ["A Song for Mama", "At Last", "Because You Loved Me", "Butterfly Kisses", "By Your Side", "Child of Mine", "Come Away With Me", "Destiny", "Father and Daughter", "Heaven", "Hero", "In My Life", "In Your Eyes", "Just the Way You Are", "Through the Years", "True Companion", "Unforgettable", "Wonderful Tonight", "You Raise Me Up"]
                    })
    puzzles.push({ name: "Weddings",
                     category: "Parties and Events",
                     words: ["best man", "bouquet", "bride ", "bridesmaids", "cake", "chapel", "church", "flower girl", "gown", "groom", "groomsmen", "husband", "kiss", "maid of honor", "minister", "pastor", "priest", "rabbi", "ring", "ring bearer", "synagogue", "toasts", "veil", "vows", "wife"]
                    })
    puzzles.push({ name: "Careers",
                     category: "People And Careers",
                     words: ["Actor", "Architect", "Chef", "Coach", "Doctor", "Editor", "Farmer", "Fireman", "Lawyer", "Mailman", "Mechanic", "Nurse", "Pastor", "Pilot", "Plumber", "Policeman", "President", "Programmer", "Reporter", "Salesman", "Senator", "Singer", "Teacher", "Waiter", "Writer"]
                    })
    puzzles.push({ name: "Celebrities",
                     category: "People And Careers",
                     words: ["Adam Sandler", "Angelina Jolie", "Ben Stiller", "Beyonce Knowles", "Brad Pitt", "Britney Spears", "David Letterman", "George Clooney", "Gwyneth Paltrow", "Jay Leno", "Jennifer Aniston", "Jessica Simpson", "John Mayer", "Julia Roberts", "Justin Timberlake", "Lindsay Lohan", "Madonna", "Martha Stewart", "Matt Damon", "Oprah Winfrey", "Paris Hilton", "Rachel Ray", "Tom Hanks", "Will Ferrell"]
                    })
    puzzles.push({ name: "College Majors",
                     category: "People And Careers",
                     words: ["Accounting", "Anthropology", "Art History", "Biology", "Business", "Communications", "Computer Science", "Criminal Justice", "Design", "Economics", "Education", "Engineering", "Film", "Finance", "Geography", "Government", "History", "Journalism", "Linguistics", "Marketing", "Music", "Nursing", "Political Science", "Psychology", "Sociology"]
                    })
    puzzles.push({ name: "Community Organizations",
                     category: "People And Careers",
                     words: ["Amvets", "Big Brothers", "Big Sisters", "Boy Scouts", "Brownies", "Camp Fire Girls", "Cub Scouts", "Eagles", "Elks", "Girl Scouts", "Habitat for Humanity", "Kiwanis", "Lioness", "Lions", "Little League", "MADD", "Meals on Wheels", "PTA", "Rotary", "Salvation Army", "YMCA", "YWCA"]
                    })
    puzzles.push({ name: "Family Relationships",
                     category: "People And Careers",
                     words: ["aunt", "brother", "brother-law", "cousin", "daughter-in-law", "father", "father-in-law", "grandfather", "grandmother", "husband", "mother", "mother-in-law", "nephew", "niece", "sister", "sister-in-law", "son-in-law", "stepbrother", "stepdaughter", "stepfather", "stepmother", "stepsister", "stepson", "uncle", "wife"]
                    })
    puzzles.push({ name: "Famous Astronauts",
                     category: "People And Careers",
                     words: ["Alan Bean", "Alan Shepard", "Buzz Aldrin", "Christa McAuliffe", "Ellen Ochoa", "Eugene Cernan", "Frank Borman", "James Lovell", "John Glenn", "John Young", "Kathryn Sullivan", "Kathryn Thornton", "Mae Jemison", "Michael Collins", "Neil Armstrong", "Roberta Bondar", "Russell Schweickart", "Sally Ride", "Scott Carpenter", "Shannon Lucid", "Thomas Stafford", "Virgil Grissom", "Walter Schirra", "William Anders"]
                    })
    puzzles.push({ name: "Famous Aviators",
                     category: "People And Careers",
                     words: ["Amelia Earhart", "Amy Johnson", "Beryl Markham", "Bessie Coleman", "Charles Lindbergh", "Charles Yeager", "Claude Grahame-White", "Edward Rickenbacker", "Harriet Quimby", "Jerrie Mock", "Jesse Brown", "John Duigan", "Lord Brabazon", "Lores Bonny", "Orville Wright", "Ralph Johnstone", "The Red Baron", "Tom Sopwith", "Wilbur Wright", "Wiley Post"]
                    })
    puzzles.push({ name: "Famous Chefs",
                     category: "People And Careers",
                     words: ["Anna Olson", "Bobby Flay", "Carmen Quagliata", "Curtis Stone", "David Chang", "Emeril Lagasse", "Giada De Laurentiis", "Gordon Ramsey", "Ina Garten", "Jacques Pepin", "Jacques Torres", "James Beard", "Jamie Oliver", "Julia Child", "Mario Batali", "Martin Yan", "Nigella Lawson", "Paula Deen", "Rachael Ray", "Rocco Dispirito", "Sandra Lee", "Sanjeev Kapoor", "Tom Colicchio", "Wolfgang Puck"]
                    })
    puzzles.push({ name: "Famous Italian Americans",
                     category: "People And Careers",
                     words: ["Al Pacino", "Annette Funicello", "Brian Boitano", "Dan Marino", "Danny Devito", "Dom Deluise", "Don Ameche", "Francis Ford Coppola", "Frank Sinatra", "Henry Mancini", "Jimmy Durante", "Joe Dimaggio", "Joe Pesci", "Madonna", "Mario Puzo", "Marisa Tomei", "Martin Scorsese", "Oleg Cassini", "Paul Giamatti", "Perry Como", "Rachael Ray", "Rocky Graziano", "Rocky Marciano", "Rudy Giuliani", "Yogi Berra"]
                    })
    puzzles.push({ name: "Famous Philosophers",
                     category: "People And Careers",
                     words: ["Confucius", "Adam Smith", "Aristotle", "Averroes", "Bertrand Russell", "Boethius", "David Hume", "Immanuel Kant", "Jean-Paul Sartre", "John Dewey", "John Locke", "Karl Marx", "Maimonides", "Niccolo Machiavelli", "Plato", "Plotinus", "Rene Descartes", "Sir Thomas More", "Socrates", "Soren Kierkegaard", "Thomas Hobbes", "Voltaire", "William James"]
                    })
    puzzles.push({ name: "Famous Psychologist",
                     category: "People And Careers",
                     words: ["Aaron Beck", "Abraham Maslow", "Albert Ellis", "Alfred Binet", "Alfred Kinsey", "Carl Jung", "Carl Rogers", "Erich Fromm", "Erik Erikson", "Fritz Perls", "Gordon Allport", "Harry Harlow", "Ivan Pavlov", "Jean Piaget", "Joseph Wolpe", "Kurt Lewin", "Milton Erickson", "Noam Chomsky", "Rollo May", "Sigmund Freud", "Timothy Leary", "Virginia Satir", "William Glasser"]
                    })
    puzzles.push({ name: "Groups of People",
                     category: "People And Careers",
                     words: ["alliance", "assembly", "association", "chapter", "club", "coalition", "company", "confederation", "congregation", "corporation", "ensemble", "faction", "federation", "fellowship", "fraternity", "institute", "league", "organization", "party", "sect", "society", "sorority", "team", "troop", "union"]
                    })
    puzzles.push({ name: "Jewish Heroes",
                     category: "People And Careers",
                     words: ["Abigail Levy Franks", "Anne Frank", "Avital Sharansky", "Colonel Leon Dyer", "Edward Rosewater", "Emile Berliner", "Emma Lazarus", "Ernestine Rose", "Golda Meir", "Hannah Senesh", "Hannah Solomon", "Isaac Mayer Wise", "Leopold Karpeles", "Maud Nathan", "Menachem Begin", "Mordecai Sheftall", "Natan Sharansky", "Nathan Strauss", "Otto Frank", "Sandy Koufax", "Yonotan Netanyahu"]
                    })
    puzzles.push({ name: "Notable African Americans",
                     category: "People And Careers",
                     words: ["Barack Obama", "Bill Cosby", "Carl Lewis", "Duke Ellington", "Frederick Douglass", "Harriet Tubman", "Jesse Jackson", "Jesse Owens", "Langston Hughes", "Louis Armstrong", "Maya Angelou", "Medgar Evers", "Michael Jackson", "Nat King Cole", "Natalie Cole", "Oprah Winfrey", "Richard Wright", "Rosa Parks", "Sojourner Truth", "Tiger Woods", "Toni Morrison", "Wilma Rudolph"]
                    })
    puzzles.push({ name: "Notable Asian Americans",
                     category: "People And Careers",
                     words: ["Ali Akbar Khan", "Allen Say", "Amy Tan", "Ang Lee", "Ann Curry", "Anna Sui", "Bruce Lee", "Connie Chung", "Deepak Chopra", "James Yee", "Kristi Yamaguchi", "Lisa Ling", "Margaret Cho", "Michael Chang", "Michelle Kwan", "Michelle Wie", "Midori", "Norman Mineta", "Sandra Oh", "Tiger Woods", "Vera Wang", "Yo Yo Ma", "Yoko Ono"]
                    })
    puzzles.push({ name: "Notable Hispanic Americans",
                     category: "People And Careers",
                     words: ["Alberto Salazar", "America Ferrera", "Anthony Munoz", "Antonia Novello", "Carlos Noriega", "Carlos Santana", "Cesar Chavez", "Desi Arnaz", "Dolores Huerta", "Edward James Olmos", "Ellen Ochoa", "Isabel Allende", "Jennifer Lopez", "Jerry Garcia", "Jose Canseco", "Junipero Serra", "Luis Walter Alvarez", "Mario Molina", "Oscar de la Hoya", "Rupert Garcia", "Salma Hayek", "Sammy Sosa", "Scott Gomez", "Severo Ochoa"]
                    })
    puzzles.push({ name: "People In Uniforms",
                     category: "People And Careers",
                     words: ["admiral", "astronaut", "bellhop", "bus driver", "captain", "cheerleader", "diver", "doctor", "doorman", "firefighter", "football player", "jockey", "judge", "mail carrier", "marine", "nurse", "paramedic", "park ranger", "pilot", "police officer", "referee", "sheriff", "soldier", "umpire", "waiter"]
                    })
    puzzles.push({ name: "Sports Stars",
                     category: "People And Careers",
                     words: ["Alex Rodriguez", "Andre Agassi", "Annika Sorenstam", "Cal Ripken", "Dale Earnhardt Jr", "David Beckham", "Derek Jeter", "Jeff Gordon", "Joe Montana", "John Daly", "Kobe Bryant", "Lance Armstrong", "Larry Bird", "Lebron James", "Magic Johnson", "Michael Jordan", "Pete Sampras", "Peyton Manning", "Roger Federer", "Serena Williams", "Tiger Woods", "Tom Brady", "Venus Williams", "Walter Payton"]
                    })
    puzzles.push({ name: "Amphibians: Lake and Pond",
                     category: "Plants And Animals",
                     words: ["Bullfrog", "Fire-bellied toad", "Hokkaido salamander", "Hourglass treefrog", "Lesser siren", "Mandarin salamander", "Marine toad", "Midwife toad", "Mudpuppy", "Olm", "Three-toed amphiuma", "Tropical clawed frog", "Two-lined salamander"]
                    })
    puzzles.push({ name: "Amphibians: Rainforest",
                     category: "Plants And Animals",
                     words: ["African wart frog", "Blue-toed rocket frog", "Free Madagascar frog", "Gold-striped frog", "Golden toad", "Hip pocket frog", "Hourglass treefrog", "La Palma glass frog", "Marbled caecilian", "Poison dart frog", "Red caecilian", "Seychelles frog", "Surinam horned frog", "Tusked frog"]
                    })
    puzzles.push({ name: "Amphibians: River and Stream",
                     category: "Plants And Animals",
                     words: ["Ailao moustache toad", "Cayenne caecilian", "Ceylon caecilian", "Dusky salamander", "Hellbender", "Hokkaido salamander", "La Palma glass frog", "Rock River frog", "Tropical clawed frog", "Two-lined salamander"]
                    })
    puzzles.push({ name: "Amphibians:Deciduous Forest",
                     category: "Plants And Animals",
                     words: ["Arboreal Salamander", "Asian Horned Frog", "Brown Frog", "Common Squeaker", "Fire-bellied Toad", "Goliath Frog", "Hairy Frog", "Harlequin Frog", "Kinugasa Flying Frog", "Marine Toad", "Mexican Caecilian", "Natal Ghost Frog", "Painted Frog", "Pumpkin Toadlet", "Rock River Frog", "Smooth Newt", "Tusked Frog", "Yellow-bellied Toad"]
                    })
    puzzles.push({ name: "Amphibians:Grasslands",
                     category: "Plants And Animals",
                     words: ["Asian horned frog", "Banded Rubber Frog", "Brown Frog", "Bubbling Kassina", "Fire-bellied toad", "Gray Four-eyed Frog", "Great Crested Newt", "Mandarin Salamander", "Marine Toad", "Painted Reed Frog", "Painted reed frog", "Paradox Frog", "Parsley Frog", "Patagonia Frog", "Tiger Salamander", "Water-holding frog"]
                    })
    puzzles.push({ name: "Animals That Mate For Life",
                     category: "Plants And Animals",
                     words: ["Albatrosses", "Anglerfish", "Bald Eagles", "Barn Owls", "Beavers", "Black Vultures", "Brolga Cranes", "Canada Geese", "Condors", "Coyotes", "Emperor Penguins", "French Angel Fish", "Gibbon apes", "Golden Eagles", "Ospreys", "Pigeons", "Prairie Voles", "Prions", "Red-tailed Hawks", "Sandhill Cranes", "Swans", "Termites", "Turtle Doves", "Wolves"]
                    })
    puzzles.push({ name: "Animals With Longest Life Span",
                     category: "Plants And Animals",
                     words: ["Alligator", "Bison", "Box Turtle", "Bullfrog", "Carp", "Catfish", "Chimpanzee", "Cobra", "Cottonmouth", "Eagle", "Eel", "Elephant", "English Sparrow", "Giant Salamander", "Giant Tortoise", "Great Horned Owl", "Grizzly Bear", "Hippo", "Horse", "Parrot", "Snapping Turtle", "Swan", "Tiger", "Toad", "Turkey Buzzard"]
                    })
    puzzles.push({ name: "Bats",
                     category: "Plants And Animals",
                     words: ["Brown", "California Mycosis", "Dawn", "Flying Fox", "Free-tailed", "Fruit", "Furry-tailed", "Ghost Faced", "Gray", "Hawaiian Hoary Bat", "Indiana Bat", "Leaf-nosed", "Long-Tongued", "Mexican Free Tailed", "Ozark Big-eared", "Pallid", "Pocketed Free", "Silver-Haired", "Spotted", "Vampire", "Virginia Big-eared", "Western Mastiff", "Western Pipistrelle"]
                    })
    puzzles.push({ name: "Bears",
                     category: "Plants And Animals",
                     words: ["American Black", "Asiatic Black", "Atlas", "Baluchistan", "Blue", "Brown", "Cinnamon", "Eurasian Brown", "European Brown", "Formosan", "Giant Panda", "Gobi", "Grizzly", "Himalayan Brown", "Himalayan Red", "Hokkaido Brown", "Kamchatka Brown", "Kermode", "Kodiak", "Pakistan Black", "Polar", "Siberian Brown", "Sloth", "Spectacled", "Sun"]
                    })
    puzzles.push({ name: "Beetles",
                     category: "Plants And Animals",
                     words: ["Black Blister", "Bombardier Beetle", "Click Beetle", "Delta Flower Scarab", "Dogbane Leaf", "Fiery Searcher", "Fireflies", "Flower Longhorn", "Ground Beetle", "Japanese Beetle", "Jewel Beetle", "June Beetle", "Ladybug Beetle", "Leaf Beetle", "Locust Borer", "Milkweed Leaf", "Orange Blister", "Red Milkweed Beetle", "Soldier Beetle", "Spotted Cucumber", "Stag Beetle", "Tiger Beetle", "Weevil", "White Beach Tiger"]
                    })
    puzzles.push({ name: "Cactus and Succulent Plants",
                     category: "Plants And Animals",
                     words: ["Agave", "Aloe Vera", "Aloe Yucca", "Barrel", "Bear grass", "Brain plant", "Burro tail", "Calico hearts", "Frankincense", "Green platters", "Living stones", "Lizard tail", "Madagascar palm", "Mole plant", "Moss rose", "Myrrh", "Necklace vine", "Orchid ", "Owls eyes", "Paddle plant", "Pearl aloe", "Powder puff", "Rattlesnake tail", "Scarlet plume", "Velvet leaf"]
                    })
    puzzles.push({ name: "Domestic Animals",
                     category: "Plants And Animals",
                     words: ["Camel", "Cat", "Chicken", "Cow", "Dog", "Donkey", "Duck", "Ferret", "Gerbil", "Goat", "Goldfish", "Goose", "Hamster", "Horse", "Llama", "Mouse", "Parakeet", "Pig", "Pigeon", "Rabbit", "Rat", "Reindeer", "Sheep", "Turkey", "Turtle"]
                    })
    puzzles.push({ name: "Ducks and Geese",
                     category: "Plants And Animals",
                     words: ["American Black Duck", "American Wigeon", "Baikal Teal", "Black Scoter", "Brant", "Brazilian Duck", "Bufflehead", "Cackling Goose", "Canada Goose", "Canvasback", "Cinnamon Teal", "Comb Duck", "Common Eider", "Common Goldeneye", "Emperor Goose", "Gadwall", "Greater Snow Goose", "Mallard", "Ruddy Duck", "Smew", "Southern Pochard", "Surf Scoter", "Torrent Duck", "Tundra Swan", "Wood Duck"]
                    })
    puzzles.push({ name: "Frogs And Toads",
                     category: "Plants And Animals",
                     words: ["African Reed Frog", "Asian Toad", "Bell Toad", "Bullfrog", "Burrowing Toad", "Clawed Frog", "Fire Belly Toad", "Flying Frog", "Ghost Frog", "Glass Frog", "Indian Frog", "Mantella", "Painted Frog", "Parsley Frog", "Poison Frog", "Saddleback Toad", "Seychelles Frog", "Shovelnose Frog", "Spadefoot Frog", "Subsaharan Frog", "Tongueless Frog", "Treefrog", "True Frog", "Tukeit Hill Frog"]
                    })
    puzzles.push({ name: "Fruits",
                     category: "Plants And Animals",
                     words: ["Apple", "Apricot", "Banana", "Blackberry", "Blueberry", "Cantaloupe", "Coconut", "Cranberry", "Grape", "Grapefruit", "Guava", "Lemon", "Lime", "Mango", "Mulberry", "Nectarine", "Orange", "Papaya", "Peach", "Pear", "Pineapple", "Plum", "Raspberry", "Strawberry", "Watermelon"]
                    })
    puzzles.push({ name: "Horned Animals",
                     category: "Plants And Animals",
                     words: ["Antelope", "Bighorn", "Billy Goat", "Bison", "Bongo", "Cape Buffalo", "Caribou", "Deer", "Eland", "Gazelle", "Giraffe", "Ibex", "Impala", "Kudu", "Longhorn", "Moose", "Mountain Goat", "Musk Ox", "Oryx", "Reindeer", "Rhinoceros", "Sheep", "Takin", "Water Buffalo", "Wildebeest"]
                    })
    puzzles.push({ name: "Hummingbird Species",
                     category: "Plants And Animals",
                     words: ["Amethyst-throated", "Berylline", "Black-throated Mango", "Broad-billed", "Cinnamon", "Crowned Woodnymph", "Cuban Emerald", "Dusky ", "Emerald-Chinned", "Fork-Tailed Emerald", "Green Breasted Mango", "Green Violet-ear", "Green-fronted", "Little Hermit", "Long-tailed Hermit", "Lucifer", "Magnificent", "Mexican Sheartail", "Stripe-tailed", "Violet Sabrewing", "White-eared", "White-necked Jacobin"]
                    })
    puzzles.push({ name: "Invertebrates",
                     category: "Plants And Animals",
                     words: ["abalone", "amoeba", "anemone", "barnacle", "bee", "butterfly", "clam", "crab", "dragonfly", "earthworm", "flatworm", "jellyfish", "leech", "lobster", "mite", "mussel", "octopus", "oyster", "sand dollar", "scorpion", "sea cucumber", "sea urchin", "snail", "spider", "starfish"]
                    })
    puzzles.push({ name: "Owls of Africa",
                     category: "Plants And Animals",
                     words: ["African Barred", "African Grass", "African Marsh", "African Wood", "Albertine", "Cape Eagle", "Chestnut", "Cinnamon Scops", "Congo Bay", "Desert Eagle", "Eurasian Eagle", "Grand Comoro Scops", "Little", "Madagascar Hawk", "Madagascar Scops", "Pearl-Spotted", "Pemba Scops", "Red-chested", "Rufous Fishing", "Seychelles Scops", "Spotted Eagle", "Usambara Eagle", "White-faced Scops"]
                    })
    puzzles.push({ name: "Owls of Asia",
                     category: "Plants And Animals",
                     words: ["Asian Barred", "Barking", "Boobook", "Brown Wood", "Celebes Barn", "Cinnabar Hawk", "Collared ", "Eastern Grass", "Greater Sooty", "Himalayan Wood", "Indian Eagle", "Japanese Scops", "Javan", "Malay Fish", "Manus Masked", "Minahassa Barn", "Mottled Wood", "Oriental Bay", "Pallid Scops", "Reddish Scops", "Speckled Hawk", "Spotted Wood", "Taliabu Masked", "Ural"]
                    })
    puzzles.push({ name: "Owls of Central America",
                     category: "Plants And Animals",
                     words: ["Ashy-faced", "Bare-legged", "Bare-shanked Screech", "Bearded Screech", "Burrowing", "Common Barn", "Costa Rican Pygmy", "Crested", "Crested", "Cuban Pygmy", "Flammulated", "Great Horned", "Guatemalan Screech", "Jamacian", "Mountain Pygmy", "Pacific Screech", "Puerto Rican Screech", "Striped ", "Sygian", "Tropical Screech", "Unspotted Saw-whet", "Whiskered Screech"]
                    })
    puzzles.push({ name: "Owls of North America",
                     category: "Plants And Animals",
                     words: ["Balsas Screech", "Barred", "Black and White", "Boreal", "Cape Pygmy", "Colima Pygmy", "Eastern Screech", "Elf", "Fulvous", "Great Gray", "Long Eared", "Mottled", "Mountain Pygmy", "Northern Hawk", "Northern Pygmy", "Northern Saw-whet", "Oaxaca Screech", "Short-eared", "Snowy ", "Spectacled ", "Spotted", "Striped", "Stygian", "Tamaulipas Pygmy", "Western Screech"]
                    })
    puzzles.push({ name: "Owls of South America",
                     category: "Plants And Animals",
                     words: ["Amazonian Pygmy", "Andean Pygmy", "Band-bellied", "Black-banded", "Black-capped Screech", "Buff-fronted", "Chaco", "Cinnamon Screech", "Cloud Forest Pygmy", "Cloud Forest Screech", "Columbian Screech", "Least Pygmy", "Long-whiskered", "Magellan Horned ", "Rio Napo Screech", "Roraima Screech", "Rufescent Screech", "Rufous-legged", "Rusty-barred", "Short-browed", "Tawny-browed"]
                    })
    puzzles.push({ name: "Parrots",
                     category: "Plants And Animals",
                     words: ["Australian King", "Bald", "Blue-Backed", "Broad-Billed", "Caica", "Cape", "Dusky", "Elegant", "Ground", "Hooded", "Large Fig", "Night", "Orange-Cheeked", "Painted Tiger", "Paradise", "Princess", "Regent", "Rock", "Singing", "Swift", "Turquoise", "Vulturine", "White-Crowned", "Yellow-Eared"]
                    })
    puzzles.push({ name: "Spider",
                     category: "Plants And Animals",
                     words: ["Bark crab", "Bold jumper", "Cardinal Jumper", "Celer crab", "Daddy Long Leg", "Dewdrop", "Fishing", "Flower crab", "Ground crab", "Hammerjawed jumper", "Leaflitter crab", "Nursery web", "Parson", "Pirate wolf", "Slender crab", "Striped lynx", "black widow", "brown recluse", "garden", "grass", "green lynx", "house", "tarantula", "wolf"]
                    })
    puzzles.push({ name: "Tarantulas",
                     category: "Plants And Animals",
                     words: ["Antilles Pinktoe", "Brazilian black", "Brazilian salmon", "Chaco golden knee", "Chilean rose", "Cobalt blue", "Costa Rican zebra", "Curlyhair", "Desert blond", "Ecuadorian purple", "Goliath birdeater", "Greenbottle blue", "Indian ornamental", "Mexican bloodleg", "Mexican redknee", "Mexican rustleg", "Pinktoe", "Rio Grande gold", "Salem ornamental", "Sandy horned baboon", "Suntiger", "Thailand black", "Tigerrump"]
                    })
    puzzles.push({ name: "Turtles and Tortoises",
                     category: "Plants And Animals",
                     words: ["Asian Box Turtle", "Bog Turtle", "Common Musk Turtle", "Desert Tortoise", "Eastern Box Turtle", "Eastern Mud Turtle", "Elongated Tortoise", "False Map Turtle", "Florida Pond Cooter", "Galapagos Tortoise", "Gopher Tortoise", "Greek Tortoise", "Green Sea Turtle", "Leopard Tortoise", "Map Turtle", "Matamata", "Pancake Tortoise", "Russian Tortoise", "Spotted Turtle"]
                    })
    puzzles.push({ name: "Types Of Cattle",
                     category: "Plants And Animals",
                     words: ["Aberdeen Angus", "Angeln", "Angus", "Ayrshire", "Balancer", "Belgian Blue", "Belted Galloway", "Black Angus", "Braford", "Brahman", "Brangus", "British White", "Brown Swiss", "Butana", "Chianina", "Danish Red", "Dutch Belted", "Hereford", "Highland", "Holstein", "Jersey", "Kerry", "Red Angus", "Texas Longhorn", "Welsh Black"]
                    })
    puzzles.push({ name: "Vegetables",
                     category: "Plants And Animals",
                     words: ["Asparagus", "Bean", "Beet", "Broccoli", "Cabbage", "Carrot", "Cauliflower", "Celery", "Corn", "Cucumber", "Eggplant", "Garlic", "Kale", "Leek", "Lettuce", "Onion", "Pea", "Pepper", "Potato", "Pumpkin", "Radish", "Spinach", "Squash", "Tomato", "Zucchini"]
                    })
    puzzles.push({ name: "Vertebrates",
                     category: "Plants And Animals",
                     words: ["alligator", "baboon", "boa constrictor", "chimpanzee", "crocodile", "dolphin", "frog", "gecko", "gorilla", "iguana", "kangaroo", "koala bear", "monkey", "orangutan", "parrot", "rattlesnake", "salmon", "seal", "toad", "tortoise", "turtle", "viper", "walrus", "whale", "wombat"]
                    })
    puzzles.push({ name: "Wild Animals",
                     category: "Plants And Animals",
                     words: ["Alligator", "Bat", "Bear", "Bobcat", "Cheetah", "Crocodile", "Deer", "Elephant", "Elk", "Giraffe", "Kangaroo", "Leopard", "Lion", "Monkey", "Moose", "Ostrich", "Panther", "Penguin", "Porcupine", "Skunk", "Snake", "Tiger", "Warthog", "Wolf", "Zebra"]
                    })
    puzzles.push({ name: "Biblical Geography",
                     category: "Religion",
                     words: ["Ashdod", "Babel", "Babylon", "Bethany", "Bethel", "Bethlehem", "Canaan", "Damascus", "Dead Sea", "Edom", "Egypt", "Ephesus", "Galatia", "Galilee", "Golgotha", "Israel", "Jericho", "Jerusalem", "Kadesh", "Moab", "Mount Sinai", "Nazareth", "Nineveh", "Philippi", "Samaria"]
                    })
    puzzles.push({ name: "Biblical Heroes",
                     category: "Religion",
                     words: ["Abednego", "Abraham", "Daniel", "Deborah", "Esther", "Jabez", "Jacob", "Jesus", "Jochebed", "John the Apostle", "John the Baptist", "Jonah", "Joseph", "King David", "Mary", "Meshach", "Miriam", "Moses", "Nehemiah", "Noah", "Rizpah", "Ruth", "Samson", "Shadrach", "Stephen"]
                    })
    puzzles.push({ name: "Catholic Prayers and Devotions",
                     category: "Religion",
                     words: ["An Irish Blessing", "Anima Christi", "Evening Prayer", "Family Prayer", "Footprints", "Glory Be", "Grace Before Meals", "Hail Mary", "Healing Prayer", "Morning Offering", "Motherhood", "Nicene Creed", "Our Lady of Fatima", "Our Lady of Guadalupe", "Safely Home", "Serenity Prayer", "Sign of the Cross", "The Act of Contrition", "The Rosary"]
                    })
    puzzles.push({ name: "Children's Bible Stories",
                     category: "Religion",
                     words: ["A Net Full of Fish", "A Short Man", "Adam and Eve", "Baby Jesus", "Baby in a Basket", "David and Goliath", "Fiery Furnace", "Jesus is Risen", "Jonah and the Whale", "Money in A Fish", "Samson and Delilah", "Ten Commandments", "The Beginning", "The Burning Bush", "The Good Samaritan", "The Last Supper", "The Lost Sheep", "The Lost Son", "The Red Sea"]
                    })
    puzzles.push({ name: "Christian Symbolism",
                     category: "Religion",
                     words: ["Alpha", "Omega", "anchor", "anchor", "apple", "butterfly", "chi-rho", "circle", "cross", "crown", "crucifix", "dove", "egg", "flaming chalice", "fleur-de-lis", "ichthus", "keys", "lamb", "oil", "olive branch", "palm branches", "peacock", "trefoil", "turtledove", "water"]
                    })
    puzzles.push({ name: "Easter Liturgy",
                     category: "Religion",
                     words: ["Christ", "Good Friday", "Jesus", "Judas kiss", "King", "Mary", "Mary Magdalene", "Messiah", "Savior", "Son of God", "cross", "crown of thorns", "crucifixion", "disciples", "faith", "holy", "hope", "love", "peace", "pierced", "redemption", "resurrection", "risen", "sacrifice", "salvation"]
                    })
    puzzles.push({ name: "Foods Of The Bible",
                     category: "Religion",
                     words: ["barley", "calf", "dates", "figs", "flour", "goat", "gourds", "grapes", "honey", "lamb", "leeks", "lentils", "locust", "millet", "olive oil", "olives", "pomegranates", "quail", "spelt", "sycamore fruit", "unleavened bread", "venison", "vinegar", "wheat", "wine"]
                    })
    puzzles.push({ name: "Kings Of The Bible",
                     category: "Religion",
                     words: ["Abijah", "Ahab", "Ahaziah", "Amaziah", "Amon", "Asa", "David", "Hezekiah", "Jehoash", "Jehoram", "Jehoshaphat", "Jehu", "Jeroboam", "Jeroboam II", "Josiah", "Jotham", "Manasseh", "Nadab", "Omri", "Rehoboam", "Saul", "Shallum", "Solomon", "Uzziah", "Zechariah"]
                    })
    puzzles.push({ name: "Men Of The Bible",
                     category: "Religion",
                     words: ["Abel", "Abraham", "Boaz", "Cain", "Daniel", "David", "Esau", "Goliath", "Herod", "Jacob", "Jesus", "Job", "John the Baptist", "Joseph", "Joshua", "Judas", "Matthew", "Moses", "Noah", "Paul", "Peter", "Pilate", "Sampson", "Solomon", "Xerxes"]
                    })
    puzzles.push({ name: "Names For God",
                     category: "Religion",
                     words: ["Abba", "Adonai", "Alpha", "Ancient of Days", "Author", "Cornerstone", "Creator", "Deliverer", "El", "El Shaddai", "Elohim", "Jehovah", "King of Israel", "Kyrios", "Light", "Lord", "Omega", "Prince of Peace", "Redeemer", "Rock", "Shield", "Star", "Theos", "Wonderful Counselor", "Yahweh"]
                    })
    puzzles.push({ name: "New Testament Books",
                     category: "Religion",
                     words: ["Acts", "Colossians", "Ephesians", "Galatians", "Hebrews", "James", "John", "Jude", "Luke", "Mark", "Matthew", "Philemon", "Philippians", "Revelation", "Romans", "Titus"]
                    })
    puzzles.push({ name: "Old Testament Books",
                     category: "Religion",
                     words: ["Amos", "Daniel", "Deuteronomy", "Ecclesiastes", "Esther", "Exodus", "Ezekiel", "Ezra", "Genesis", "Habakkuk", "Haggai", "Hosea", "Isaiah", "Jeremiah", "Job", "Joel", "Jonah", "Joshua", "Judges", "Lamentations", "Leviticus", "Malachi", "Micah", "Nahum", "Nehemiah", "Numbers", "Obadiah", "Proverbs", "Psalms", "Ruth", "Song of Songs", "Zechariah", "Zephaniah"]
                    })
    puzzles.push({ name: "Popes from 750 to 999",
                     category: "Religion",
                     words: ["Adrian I", "Adrian II", "Adrian III", "Agapetus II", "Anastasius III", "Benedict III", "Benedict IV", "Benedict V", "Benedict VI", "Benedict VII", "Boniface VI", "Eugene II", "Formosus", "Gregory IV", "Gregory V", "John VIII", "John X", "John XI", "John XII", "John XIII", "John XIV", "John XV", "Lando", "Leo III", "Leo V", "Leo VI", "Leo VIII", "Marinus I", "Marinus II", "Nicholas I", "Nicholas the Great", "Paschal I", "Paul I", "Romanus", "Saint Adrian", "Saint Leo", "Saint Nicholas", "Saint Paschal", "Saint Paul", "Sergius II", "Sergius III", "Stephen II", "Stephen III", "Stephen IV", "Stephen V", "Stephen VI", "Stephen VII", "Stephen VIII", "Sylvester II", "Theodore II", "Valentine"]
                    })
    puzzles.push({ name: "Prophets From The Bible",
                     category: "Religion",
                     words: ["Aaron", "Abraham", "Anna", "David", "Deborah", "Eli", "Esther", "Hannah", "Hosea", "Isaac", "Isaiah", "Jacob", "Jeremiah", "John", "Jonah", "Joshua", "Malachi", "Miriam", "Moses", "Nathan", "Noah", "Obadiah", "Samuel", "Sarah", "Solomon"]
                    })
    puzzles.push({ name: "Women Of The Bible",
                     category: "Religion",
                     words: ["Abigail", "Anna", "Bathsheba", "Deborah", "Elizabeth", "Esther", "Eunice", "Eve", "Hagar", "Hannah", "Leah", "Lois", "Lydia", "Martha", "Mary", "Mary Magdalene", "Miriam", "Naomi", "Rachel", "Rahab", "Rebekah", "Ruth", "Salome", "Sarah", "Tamar"]
                    })
    puzzles.push({ name: "World Religions",
                     category: "Religion",
                     words: ["Agnostic", "Atheist", "Buddhism", "Caodaism", "Christianity", "Confucianism", "Druze", "Eckankar", "Gnosticism", "Hinduism", "Islam", "Jainism", "Juche", "Judaism", "Lukumi", "Neo-Paganism", "Rastafarianism", "Scientology", "Shinto", "Sikhism", "Spiritism", "Taoism", "Tenrikyo", "Zoroastrianism"]
                    })
    puzzles.push({ name: "Allergens And Fungi",
                     category: "Science",
                     words: ["Absidia", "Ascomycete", "Basidiomycetes", "Bipolaris", "Candida", "Curvularia", "Dreschlera", "Epicoccum", "Geotrichum", "Mucor", "Nigrospora", "Papulospora", "Phoma", "Pithomyces", "Rhizomucor", "Rhizopus", "Rhodotorula", "Stemphylium", "Syncephalastrum", "Trichoderma", "Trichophyton", "Ulocladium", "Verticillium", "Wallemia", "Yeast"]
                    })
    puzzles.push({ name: "Alternative Power",
                     category: "Science",
                     words: ["Daylight Saving Time", "active solar", "albedo", "biomass", "daylighting", "direct solar", "greenhouse effect", "heat", "hydroelectricity", "indirect solar", "infrared", "insolation", "parabolic dish", "passive solar", "photovoltaic", "power tower", "solar cell", "solar pond", "solar trough", "solar updraft tower", "sun", "trombe wall", "wave power", "wind"]
                    })
    puzzles.push({ name: "Climate Regions And Conditions",
                     category: "Science",
                     words: ["Marine West Coast", "Mediterranean", "desert", "frost", "grasslands", "grasslands", "highland", "humid continental", "humid oceanic", "humid subtropical", "icecap", "muggy", "permafrost", "rain forests", "savannahs", "savannas", "semiarid", "snow", "steppe", "subarctic", "subtropical dry", "tropical wet", "tropical wet and dry", "tundra", "windy"]
                    })
    puzzles.push({ name: "Clouds",
                     category: "Science",
                     words: ["anvil", "arcus", "cirrocumulus", "cirrus", "collar", "cumulus", "debris", "floccus", "funnel", "humilis", "incus", "knuckle", "mammatus", "nebulosus", "opacus", "pannus", "roll", "rope", "scud", "shelf", "stratocumulus", "stratus", "tuba", "velum", "wall"]
                    })
    puzzles.push({ name: "Computer Terminology",
                     category: "Science",
                     words: ["CPU", "DSL", "HTML", "ISP", "LAN", "NIC", "OS", "RAM", "ROM", "URL", "USB", "WAN", "bandwidth", "binary", "cd-rom", "desktop", "gigabyte", "hard drive", "keyboard", "megabit", "megabyte", "modem", "monitor", "mouse", "router"]
                    })
    puzzles.push({ name: "Dinosaurs",
                     category: "Science",
                     words: ["Albertosaurus", "Allosaurus", "Ankylosaurus", "Apatosaurus", "Brachiosaurus", "Camarasaurus", "Diplodocus", "Gorgosaurus", "Hypsilophodon", "Iguanodon", "Kentrosaurus", "Lambeosaurus", "Maiasaura", "Monoclonius", "Protoceratops", "Saurolophus", "Spinosaurus", "Stegosaurus", "Styracosaurus", "Torosaurus", "Trachodon", "Triceratops", "Troodon", "Tyrannosaurus Rex", "Velociraptor"]
                    })
    puzzles.push({ name: "Electricity And Magnetism",
                     category: "Science",
                     words: ["Amperes", "Coulombs", "Teslas", "alternating current", "diamagnet", "direct current", "eddy currents", "electric field", "electric potential", "electrons", "ferromagnet", "ions", "joules", "magnetic field", "magnetic levitation", "magnetic monopoles", "negative charge", "neutrons", "positive charge", "protons", "resistance", "superconductor", "volts"]
                    })
    puzzles.push({ name: "Energy",
                     category: "Science",
                     words: ["acceleration", "activation energy", "alternating current", "chemical energy", "currents", "energy of motion", "force", "frequency", "heat energy", "heat energy", "kinetic energy", "mechanical energy", "momentum", "motion", "potential energy", "rotational energy", "scalar quality", "specific heat", "velocity", "vibrational energy", "wave", "work"]
                    })
    puzzles.push({ name: "Exercise",
                     category: "Science",
                     words: ["Judo", "Kendo", "Tae Kwon-Do", "Tai Chi", "aerobics", "ballet", "belly dancing", "cycling", "ice skating", "jumping", "karate", "kayaking", "kickboxing", "pilates", "rowing", "running", "skiing", "snowboarding", "spinning", "stretching", "swimming", "tap dancing", "walking", "weight lifting", "yoga"]
                    })
    puzzles.push({ name: "Famous Physicists",
                     category: "Science",
                     words: ["Ampere", "Aristotle", "Bohr", "Boyle", "Cavendish", "Copernicus", "Coulomb", "Curie", "Dalton", "Descartes", "Doppler", "Einstein", "Fahrenheit", "Galileo", "Hertz", "Hubbell", "Joule", "Kelvin", "Mach", "Newton", "Oppenheimer", "Pascal", "Tesla", "Volta", "Watt"]
                    })
    puzzles.push({ name: "Farm Life",
                     category: "Science",
                     words: ["barn", "chicken", "chicks", "coop", "corral", "cow", "dog", "donkey", "duck", "geese", "goat", "grain", "hay", "horse", "mules", "oats", "pen", "pig", "rooster", "sheep", "silo", "stable", "tractor", "trough", "turkey"]
                    })
    puzzles.push({ name: "Fermentation",
                     category: "Science",
                     words: ["acetic acid", "aeration", "alcohol", "anaerobic", "bacteria", "beer", "bioreactors", "carbohydrates", "cider", "convert", "energy", "enzymes", "fungi", "glycolytic", "lactic acid", "metabolic process", "olives", "ph", "sugar", "temperature", "vinegar", "wine", "yeast", "zymology", "zymurgy"]
                    })
    puzzles.push({ name: "Fields Of Science",
                     category: "Science",
                     words: ["anatomy", "archaeology", "astronomy", "biochemistry", "biology", "botany", "chemistry", "climatology", "embryology", "entomology", "epidemiology", "geography", "geology", "geophysics", "immunology", "meteorology", "mineralogy", "paleontology", "physics", "physiology", "primatology", "seismology", "toxicology", "virology", "zoology"]
                    })
    puzzles.push({ name: "Fossils",
                     category: "Science",
                     words: ["amber", "asphalt", "carbonization", "casts", "compactions", "compressions", "coprolites", "dessication", "distillation", "drying", "freezing", "gastroliths", "impressions", "molds", "molecular fossils", "mummification", "permineralization", "petrification", "polymerization", "preservation", "resin", "shell", "skeleton", "trace fossils", "wax"]
                    })
    puzzles.push({ name: "Levers And Pulleys",
                     category: "Science",
                     words: ["axle", "bellows", "block and tackle", "catapult", "chain hoist", "compound pulleys", "equal arm balance", "fixed pulleys", "fulcrum", "hydraulic", "inclined plane", "lever arm", "movable pulleys", "newton", "screw", "sheave", "slope", "thread", "wedge", "wheel", "windlass"]
                    })
    puzzles.push({ name: "Matter",
                     category: "Science",
                     words: ["allotropes", "atom", "atomic radius", "boiling point", "compound", "density", "distillation", "element", "filtration", "gas", "hardness", "heterogeneous", "homogeneous", "liquid", "malleability", "mass", "melting point", "mixture", "molecule", "plasma", "pure substance", "shape", "solid", "space", "volume"]
                    })
    puzzles.push({ name: "Medical Specialties",
                     category: "Science",
                     words: ["anesthesiology", "bariatrics ", "cardiology ", "cardiothoracic ", "dermatology", "endocrinology", "gastro-intestina ", "geriatrics", "hematology", "hepatology ", "immunology", "infectious diseases ", "maxillofacial", "nephrology", "neurology", "neurosurgery", "oncolgy", "ophthalmology ", "orthopedic", "pediatrics", "plastic surgery", "pulmonology ", "rheumatology ", "traumatology", "urology"]
                    })
    puzzles.push({ name: "Molds And Toxins",
                     category: "Science",
                     words: ["Acremonium", "Aflatoxin", "Alternaria", "Aspergillus flavus", "Aspergillus niger", "Chaetomium", "Mycotoxins spp", "Ochratoxin", "Penicillium", "Tricothecene", "Zearalenone"]
                    })
    puzzles.push({ name: "Moons Of Jupiter",
                     category: "Science",
                     words: ["Adrastea", "Aitne", "Amalthea", "Ananke", "Aoede", "Arche", "Autonoe", "Callirrhoe", "Callisto", "Carme", "Carpo", "Chaldene", "Cyllene", "Elara", "Erinome", "Euanthe", "Eukelade", "Euporie", "Europa", "Eurydome", "Ganymede", "Harpalyke", "Hegemone", "Helike", "Hermippe", "Himalia", "Io", "Iocaste", "Isonoe", "Kale", "Kallichore", "Kalyke", "Kore", "Leda", "Lysithea", "Megaclite", "Metis", "Mneme", "Orthosie", "Pasiphae", "Pasithee", "Praxidike", "Sinope", "Sponde", "Taygete", "Thebe", "Thelxinoe", "Themisto", "Thyone"]
                    })
    puzzles.push({ name: "Mushrooms ",
                     category: "Science",
                     words: ["Abalone Cap", "Beefsteak", "Black", "Brown", "Brown Capped", "Button", "Chestnut", "Cinnamon Cap", "Cremini", "Death Cup", "Egg", "Field", "Forest", "Gamboni", "Honey", "Imperial", "Japanese Brown", "Lobster", "Maize", "Oyster", "Porcini", "Portabello", "Roma", "Shiitake", "Winecap"]
                    })
    puzzles.push({ name: "Natural Materials",
                     category: "Science",
                     words: ["bamboo", "bark", "clay", "cotton", "flax", "flint", "glass", "gold", "hemp", "iron", "jute", "kapok", "kenaf", "leather", "metal", "moss", "obsidian", "porcelain", "rattan", "sand", "silver", "soil", "stone", "wood", "wool"]
                    })
    puzzles.push({ name: "Ocean Features",
                     category: "Science",
                     words: ["Mariana Trench", "Pacific Ring of Fire", "abyss", "abyssal hills", "abyssal plain", "abyssal zone", "barrier reef", "black smokers", "continental margin", "continental rise", "continental shelf", "continental slope", "coral reef", "guyot", "mid-oceanic ridge", "ocean trench", "oceanic islands", "rift valley", "seamount", "shore", "submarine canyon", "submarine fan", "table mounts", "volcanic island arc"]
                    })
    puzzles.push({ name: "Rocks And Minerals",
                     category: "Science",
                     words: ["basalt", "borax", "coal", "feldspar", "garnet", "gneiss", "granite", "gypsum", "hematite", "hornblende", "limestone", "marble", "mica", "obsidian", "pumice", "pyrite", "quartz", "quartzite", "sandstone", "shale", "slate", "soapstone", "sulphur", "talc", "tourmaline"]
                    })
    puzzles.push({ name: "Sound And Light",
                     category: "Science",
                     words: ["Doppler effect", "compression", "consonance", "decibels", "denser medium", "dissonance", "frequency", "illuminance", "illuminations", "incident ray", "index of refraction", "lumen", "luminous flux", "octave", "pitch", "pulse", "rarefaction", "rarer medium", "reflected ray", "refraction", "sound waves", "ultrasonic waves", "volume"]
                    })
    puzzles.push({ name: "Textures",
                     category: "Science",
                     words: ["bumpy", "coarse", "creamy", "dense", "fibrous", "firm", "flexible", "fluffy", "furry", "fuzzy", "grainy", "hard", "rough", "rubbery", "scratchy", "silky", "slimy", "slippery", "smooth", "soft", "spongy", "squishy", "sticky", "stiff", "viscous"]
                    })
    puzzles.push({ name: "Transportation",
                     category: "Science",
                     words: ["airplane", "bike", "boat", "car", "cruise ship", "ferry", "helicopter", "horse", "hot air balloon", "jet", "monorail", "motorcycle", "rocket", "scooter", "skateboard", "snowboard", "stroller", "submarine", "subway", "surfboard", "tractor", "train", "trolley", "walk", "wheelchair"]
                    })
    puzzles.push({ name: "Variables",
                     category: "Science",
                     words: ["continuous", "continuous ordinal", "controlled", "dependent", "discrete", "dummy", "explained", "explanatory", "independent", "interval-scale", "manipulative", "measured", "multiple response", "nominal", "ordinal", "outcome", "predictor", "preference", "qualitative", "quantitative", "ratio-scale", "regressand", "regressors", "responding", "response"]
                    })
    puzzles.push({ name: "Weather",
                     category: "Science",
                     words: ["advisory", "barometer", "clear", "cloudy", "degrees", "dew point", "downpour", "drizzle", "drought", "fair", "fog", "forecast", "front", "gust", "hail", "jet stream", "lightning", "map", "overcast", "pressure", "thunder", "tides", "visibility", "watch", "wind"]
                    })
    puzzles.push({ name: "Wind",
                     category: "Science",
                     words: ["blizzard", "breeze", "chinook", "current", "cyclone", "draft", "dust devil", "foehn", "gale", "gust", "harmattan", "hurricane", "levanter", "monsoon", "puff", "simoom", "sirocco", "squall", "storm", "tornado", "typhoon", "westerly", "whirlwind", "zephyr"]
                    })
    puzzles.push({ name: "Animals",
                     category: "Science Flora Fauna",
                     words: ["Aardvark", "Asian Elephant", "Badger", "Bat", "Bison", "Blue Whale", "Bobcat", "Buffalo", "Cheetah", "Dolphin", "Elk", "Giraffe", "Gorilla", "Grizzly Bear", "Horse", "Lion", "Oryx", "Pack Rat", "Panther", "Pig", "Polar Bear", "Rabbit", "Raccoon", "Sheep", "Zebra"]
                    })
    puzzles.push({ name: "Deciduous Trees",
                     category: "Science Flora Fauna",
                     words: ["American Beech", "American Holly", "American Hornbeam", "American Smoke Tree", "Black Tupelo", "Black Walnut", "Crabapple", "Eastern Redbud", "Hackberry", "Japanese Maple", "Katsura Tree", "Korean Evodia", "Miami Crape Myrtle", "Mimosa", "Pecan", "Persimmon", "Pink Dogwood", "Red Buckeye", "River Birch", "Shag bark Hickory", "Silver Maple", "Southern Magnolia", "Turkish Filbert", "White Mulberry", "Yoshino Cherry"]
                    })
    puzzles.push({ name: "Evergreen Trees",
                     category: "Science Flora Fauna",
                     words: ["Alpine Fir", "American Holly", "Atlas Cedar", "Austrian Pine", "Balsam Fir", "Black Spruce", "Cabbage Palm", "Canadian Hemlock", "Cluster Pine", "Dragon Spruce", "Eucalyptus", "Himalayan Spruce", "Italian Cypress", "Japanese Cedar", "Laurel Oak", "Live Oak", "Loblolly bay", "Loquat", "Pitch Pine", "Portugal Laurel", "Redbay", "Redwood", "Russian Olive", "Savannah Holly"]
                    })
    puzzles.push({ name: "Flowers",
                     category: "Science Flora Fauna",
                     words: ["Azalea", "Buttercup", "Camellia", "Carnation", "Chrysanthemum", "Daffodil", "Daisy", "Fuschia", "Gardenia", "Geranium", "Heather", "Iris", "Lavender", "Lilac", "Lily", "Marigolds", "Orchid", "Pansy", "Peony", "Poinsettia", "Poppy", "Rose", "Sunflower", "Tulip", "Violet"]
                    })
    puzzles.push({ name: "Lilies",
                     category: "Science Flora Fauna",
                     words: ["Avalanche", "Bear Grass", "Brodiaea", "Camas", "Checker", "Coast Range Mariposa", "Crag", "Death Camas", "English Bluebells", "Fairy Bells", "Fairy Lanterns", "Firecracker Flower", "Flower Power", "Giant White Fawn", "Monterey Mariposa", "Ookow", "Pink Diamond", "Pink Fawn", "Subalpine Mariposa", "Tiger", "Twisted Stalk", "Yellow Mariposa", "Yellowbells"]
                    })
    puzzles.push({ name: "Ocean Life",
                     category: "Science Flora Fauna",
                     words: ["angel fish", "barnacles", "barracuda", "coral", "crab", "eel", "jellyfish", "kelp", "lobster", "manatee", "octopus", "phytoplankton", "sand dollar", "sea anemone", "sea horse", "sea lion", "sea turtle", "sea urchin", "seal", "shark", "shrimp", "squid", "starfish", "sting ray", "whale"]
                    })
    puzzles.push({ name: "Oldest Trees",
                     category: "Science Flora Fauna",
                     words: ["Alerce", "Coast Douglas Fir", "Coast Redwood", "Fortingall Yew", "General Grant Tree", "General Sherman", "Giant Sequoia", "Haresfield Oak", "Huon Pine", "Kauri Tane Mahuta", "Law Day Oak", "Montezuma Cypress", "Norway Spruce", "Oriental Plane Tree", "Queen Elizabeth Oak", "Sitka Spruce", "Western Red Cedar", "White Cedar", "White Oak", "Yellow Birch"]
                    })
    puzzles.push({ name: "Reptiles",
                     category: "Science Flora Fauna",
                     words: ["Adder", "Alligator", "Anaconda", "Bearded Dragon", "Boa Constrictor", "Burmese Python", "Bushmaster", "Coral Snake", "Crocodile", "Galapagos Tortoise", "Gecko", "Gila Monster", "Gopher Snake", "Horned Lizard", "Iguana", "King Cobra", "King Snake", "Komodo Dragon", "Monitor Lizard", "Rattle Snake", "Sea Turtle", "Sidewinder", "Skink", "Snapping Turtle", "Viper"]
                    })
    puzzles.push({ name: "Roses",
                     category: "Science Flora Fauna",
                     words: ["Angel Face", "Behold", "Bourbon", "Brandy", "Cachet", "Centifolia", "Climbing", "Damask", "English", "Floribunda", "Gold Medal", "Grandiflora", "Hybrid Foetida", "Hybrid Gallica", "Hybrid Musk", "Hybrid Perpetual", "Hybrid Rugosa", "Hybrid Tea", "Landscape", "Miniature", "Moss", "Polyantha", "Portland", "Romantica"]
                    })
    puzzles.push({ name: "Spring Flowers",
                     category: "Science Flora Fauna",
                     words: ["Agapanthus", "Amaryllis", "Anemone", "Birds of Paradise", "Bloodroot", "Buttercup", "Cherry blossom", "Crocus", "Dahlia", "Eastern Redbud", "Freesia", "Ghostflower", "Heather", "Hyacinth", "Iris", "Lily", "Mountain Laurel", "Orchids", "Peony", "Rose", "Snowdrop", "Sweet Crabapple", "Sweet Pea", "Tulip", "Zinnia"]
                    })
    puzzles.push({ name: "Trees",
                     category: "Science Flora Fauna",
                     words: ["Almond", "Ash", "Aspen", "Beech", "Birch", "Cedar", "Chestnut", "Cottonwood", "Cypress", "Elm", "Eucalyptus", "Fir", "Hickory", "Juniper", "Magnolia", "Maple", "Oak", "Pine", "Poplar", "Redwood", "Sequoia", "Spruce", "Sycamore", "Walnut", "Willow"]
                    })
    puzzles.push({ name: "Tulips",
                     category: "Science Flora Fauna",
                     words: ["Artist", "Ballerina", "Bing Crosby", "Blue Parrot", "Capri", "China Pink", "Concerto", "Diana", "Diplomat", "Esther", "Flair", "Garden Party", "Grand Style", "High Noon", "Jimmy", "Kaleidoscope", "Maureen", "Mickey Mouse", "Miranda", "Orange Emperor", "Oscar", "Parade", "Ruby Red", "Snow Lady", "Summit"]
                    })
    puzzles.push({ name: "Types Of Pines",
                     category: "Science Flora Fauna",
                     words: ["Black Pine", "Bristlecone Pine", "Bull-Pine", "Cuban", "Eastern White", "Foxtail Pine", "Jack-Pine", "Lace Bark", "Lodge-Pole Pine", "Long-Leaf", "Mexican Nut", "Norway", "Pinyon", "Pitch-pine", "Ponderosa", "Red", "Rocky Mountain White", "Scotch", "Short-Leaf", "Slash", "Spruce Pine", "Sugar-Pine", "Western White", "White"]
                    })
    puzzles.push({ name: "Weeds",
                     category: "Science Flora Fauna",
                     words: ["Annual Bluegrass", "Aster", "Barnyard Grass", "Bittercress", "Black Medic", "Broom Sedge", "Chickweed", "Clover", "Crabgrass", "Dallisgrass", "Dandelion", "Deadnettle", "Dollarweed", "Fall Panicum", "Foxtail Barley", "Garlic Mustard", "Goosegrass", "Henbit", "Johnson Grass", "Knawel", "Knotgrass", "Large Crabgrass", "Lawn Burweed", "Milkweed", "Stinkgrass"]
                    })
    puzzles.push({ name: "American Indian Tribes",
                     category: "Social Studies",
                     words: ["Apache", "Arapahoe", "Blackfeet", "Cheyenne", "Chickasaw", "Chippewa", "Choctaw", "Comanche", "Cree", "Creek", "Havasupai", "Hopi", "Kiowa", "Kumeyaay", "Lakota", "Narragansett", "Navajo", "Paiute", "Pueblo", "Samish", "Seminole", "Shawnee", "Shoshone", "Ute", "Washoe"]
                    })
    puzzles.push({ name: "Japanese Prime Ministers",
                     category: "Social Studies",
                     words: ["Abe Shinzo", "Ashida Hitoshi", "Aso Taro", "Fukuda Takeo", "Fukuda Yasuo", "Hashimoto Ryutaro", "Hatoyama Ichiro", "Hatoyama Yukio", "Hosokawa Morihiro", "Ikeda Hayato", "Ishibashi Tanzan", "Kaifu Toshiki", "Kan Naoto", "Katayama Tetsu", "Kishi Nobusuke", "Koizumi Junichiro", "Miki Takeo", "Miyazawa Kiichi", "Mori Yoshiro", "Nakasone Yasuhiro", "Obuchi Keizo", "Ohira Masayoshi", "Sato Eisaku", "Suzuki Zenko", "Tanaka Kakuei", "Uno Sosuke", "Yoshida Shigeru"]
                    })
    puzzles.push({ name: "Supreme Court Justices",
                     category: "Social Studies",
                     words: ["Earl Warren", "James Iredell", "James Wilson", "John Blair", "John Jay", "John Marshall", "John Rutledge", "Oliver Ellsworth", "Samuel Chase", "Thomas Johnson", "William Cushing", "William Paterson"]
                    })
    puzzles.push({ name: "Supreme Court Justices 2",
                     category: "Social Studies",
                     words: ["Alfred Moore", "Bushrod Washington", "David Davis", "Gabriel Duval", "Henry Baldwin", "John Catron", "John McKinley", "John McLean", "Joseph Storey", "Levi Woodbury", "Nathan Clifford", "Robert Trimble", "Samuel Nelson", "Smith Thompson", "Thomas Todd", "William Johnson"]
                    })
    puzzles.push({ name: "Supreme Court Justices 3",
                     category: "Social Studies",
                     words: ["George Sutherland", "Horace Gray", "Joseph McKenna", "Mahlon Pitney", "Pierce Butler", "Samuel Blatchford", "Stanley Matthews", "Ward Hunt", "William Strong", "Willis Van Devanter"]
                    })
    puzzles.push({ name: "Supreme Court Justices 4",
                     category: "Social Studies",
                     words: ["Abe Fortas", "Antonin Scalia", "Clarence Thomas", "Felix Frankfurter", "Hugo Black", "Potter Stewart", "Ruth Bader Ginsburg", "Sherman Minton", "Thurgood Marshall"]
                    })
    puzzles.push({ name: "A Words",
                     category: "Speech and Language",
                     words: ["aback", "abbey", "abhor", "absolutely", "acne", "acorn", "actor", "actress", "acute", "add", "adept", "adoption", "affection", "after", "age", "aim", "allocate", "alphabet", "always", "angel", "animal", "any", "apple", "apron", "atlas"]
                    })
    puzzles.push({ name: "B Words",
                     category: "Speech and Language",
                     words: ["baby", "bag", "balloon", "barbeque", "barge", "beautiful", "bed", "begin", "best", "between", "billow", "bitter", "bliss", "blizzard", "blue", "boast", "boat", "book", "boot", "boss", "bottle", "boy", "brisk", "bubble", "bug"]
                    })
    puzzles.push({ name: "C Words",
                     category: "Speech and Language",
                     words: ["cab", "cabin", "cabinet", "cable", "caboose", "cactus", "cafeteria", "cage", "cake", "calcium", "calculator", "calendar", "calf", "call", "calm", "came", "canal", "car", "cash", "cast", "cast", "cat", "class", "coach", "coffee"]
                    })
    puzzles.push({ name: "D Words",
                     category: "Speech and Language",
                     words: ["dad", "damp", "dark", "data", "date", "day", "deal", "debate", "debt", "deduce", "deer", "defeat", "definition", "deliberate", "demand", "democracy", "develop", "different", "discipline", "disdain", "dive", "does", "dog", "door", "drum"]
                    })
    puzzles.push({ name: "E Words",
                     category: "Speech and Language",
                     words: ["east", "eat", "edit", "egg", "elbow", "election", "emotion", "empty", "emulate", "enable", "enemy", "enter", "entity", "equality", "equate", "ethics", "exaggerate", "excited", "exit", "expect", "expectation", "expedite", "exploit", "extortion", "extreme"]
                    })
    puzzles.push({ name: "F Words",
                     category: "Speech and Language",
                     words: ["fact", "fad", "fair", "faith", "family", "fare", "father", "fault", "fax", "fear", "feminine", "fib", "fickle", "fig", "fight", "final", "find", "fire", "fish", "flag", "flour", "follow", "food", "foreign", "found"]
                    })
    puzzles.push({ name: "G Words",
                     category: "Speech and Language",
                     words: ["gale", "gallop", "game", "gear", "general", "genius", "gift", "girl", "give", "go", "goat", "gold", "good", "gourd", "gout", "government", "grace", "grand", "gravy", "gray", "great", "green", "group", "gullible", "gust"]
                    })
    puzzles.push({ name: "Golf: PGA Players 5",
                     category: "Speech and Language",
                     words: ["Bill Haas", "Bob Heintz", "Brandt Jobe", "Charles Howell III", "Charley Hoffman", "Dudley Hart", "Dustin Johnson", "Fredrik Jacobson", "Gabriel Hjerstedt", "Hiroshi Iwata", "John Huston", "Lee Janzen", "Mark Hensby", "Mike Heinen", "Padraig Harrington", "Ryuji Imada", "Scott Gump", "Scott Gutschewski", "Tim Herron", "Todd Hamilton", "Trevor Immelman"]
                    })
    puzzles.push({ name: "H Words",
                     category: "Speech and Language",
                     words: ["habit", "habitat", "hail", "hair", "half", "hallow", "halt", "hammer", "hand", "handicap", "hang", "happy", "harbor", "hard", "harm", "harrow", "harsh", "harvest", "hassle", "haste", "haul", "have", "haven", "hazard", "horse"]
                    })
    puzzles.push({ name: "I Words",
                     category: "Speech and Language",
                     words: ["ideal", "identical", "identify", "idiom", "idiosyncratic", "idle", "ignite", "ignorance", "ignore", "ill", "illegal", "illusive", "illustrate", "image", "imagination", "imitate", "immature", "immersed", "imminent", "induce", "indulge", "insipid", "inspect", "inspire", "instant"]
                    })
    puzzles.push({ name: "J Words",
                     category: "Speech and Language",
                     words: ["jacket", "jagged", "jam", "jar", "jaunty", "jealous", "jeopardize", "jet", "job", "jog", "joint", "joke", "jolt", "jovial", "joy", "judge", "judicious", "jug", "juice", "jump", "jungle", "just", "justice", "juvenile", "juxtapose"]
                    })
    puzzles.push({ name: "K Words",
                     category: "Speech and Language",
                     words: ["keen", "keep", "ken", "kernel", "key", "kick", "kid", "kidney", "kin", "kind", "kindle", "kindred", "kinetic", "kismet", "kiss", "knack", "knead", "knell", "knife", "knight", "knob", "knock", "knot", "know", "knowledge"]
                    })
    puzzles.push({ name: "L Words",
                     category: "Speech and Language",
                     words: ["label", "labor", "lack", "ladle", "lamb", "lament", "land", "language", "languid", "large", "lark", "lash", "lassitude", "lasting", "later", "lather", "latitude", "latter", "laugh", "lean", "listen", "live", "longitude", "loud", "love"]
                    })
    puzzles.push({ name: "Long A Words",
                     category: "Speech and Language",
                     words: ["acorn", "aim", "angel", "ape", "bail", "bake", "cake", "daisy", "face", "fail", "flake", "hail", "hair", "jay", "lady", "mail", "nail", "pail", "plane", "rain", "rake", "sail", "stapler", "table", "whale"]
                    })
    puzzles.push({ name: "Long E Words",
                     category: "Speech and Language",
                     words: ["bee", "deal", "easel", "eat", "eel", "feed", "feel", "heap", "key", "lead", "leaf", "meal", "meat", "needle", "pea", "queen", "read", "sea", "seal", "seat", "sheep", "tepee", "tree", "wheel", "zebra"]
                    })
    puzzles.push({ name: "Long I Words",
                     category: "Speech and Language",
                     words: ["bike", "dice", "dinosaur", "fight", "fire", "five", "gripe", "hive", "ice", "idea", "iris", "iron", "island", "ivy", "kite", "light", "lion", "mice", "pipe", "pliers", "rhino", "rice", "ripe", "sight", "tiger"]
                    })
    puzzles.push({ name: "Long O Words",
                     category: "Speech and Language",
                     words: ["bone", "coal", "cope", "coral", "doe", "foe", "froze", "go", "hope", "nose", "oat", "oboe", "oboe", "ocean", "oval", "phone", "robot", "rose", "slope", "snow", "so", "toad", "toes", "tone", "zone"]
                    })
    puzzles.push({ name: "Long U Words",
                     category: "Speech and Language",
                     words: ["amuse", "bugle", "cube", "cute", "dune", "fugue", "fuse", "fuse", "glue", "huge", "juice", "mule", "music", "rule", "ruse", "salute", "suit", "tube", "tune", "ukulele", "unicorn", "unicyle", "uniform", "use", "utensil"]
                    })
    puzzles.push({ name: "M Words",
                     category: "Speech and Language",
                     words: ["main", "malleable", "manage", "mandatory", "maneuver", "manifest", "manner", "mantle", "many", "map", "march", "mark", "marsh", "masquerade", "mass", "master", "meal", "measure", "moral", "more", "morning", "multiply", "mundane", "mysterious", "myth"]
                    })
    puzzles.push({ name: "N Words",
                     category: "Speech and Language",
                     words: ["naive", "narrate", "narrow", "nation", "native", "near", "neat", "need", "negate", "negative", "neglect", "negotiate", "nerve", "net", "neutral", "niche", "night", "noise", "nominate", "notable", "nothing", "nozzle", "number", "nurse", "nutrition"]
                    })
    puzzles.push({ name: "O Words",
                     category: "Speech and Language",
                     words: ["obscure", "observe", "occasion", "occur", "odd", "offer", "official", "old", "olfaction", "omit", "once", "onomatopoeia", "onslaught", "ooze", "operate", "opponent", "opposition", "optical", "option", "orbit", "ordeal", "organ", "original", "ornery", "oust"]
                    })
    puzzles.push({ name: "Ou Words",
                     category: "Speech and Language",
                     words: ["ouch", "oud", "ought", "ounce", "our", "ourselves", "ousel", "oust", "ousted", "out", "outage", "outcast", "outcome", "outdate", "outdo", "outdoors", "outerwear", "outfit", "outgoing", "outing", "outlast", "output", "outrage", "outreach", "outside"]
                    })
    puzzles.push({ name: "P Words",
                     category: "Speech and Language",
                     words: ["partial", "partnership", "pass", "past", "patient", "perforate", "perform", "persuade", "petition", "phase", "physical", "pick", "pile", "plunge", "poem", "poignant", "point", "ponder", "pout", "prefer", "premise", "prepare", "pure", "purpose", "pursue"]
                    })
    puzzles.push({ name: "Q Words",
                     category: "Speech and Language",
                     words: ["quack", "quad", "quail", "quake", "qualification", "qualify", "quality", "quantity", "quantum", "quarrel", "quarter", "quench", "query", "question", "queue", "quick", "quick", "quiet", "quilt", "quintessential", "quip", "quirky", "quit", "quite", "quota"]
                    })
    puzzles.push({ name: "QU Words",
                     category: "Speech and Language",
                     words: ["quack", "quad", "quadrant", "quadriceps", "quadruple", "quail", "quaint", "quaker", "quaky", "qualify", "quality", "quandary", "quantify", "quantitative", "quantity", "quantum", "quarrel", "quarrier", "quarry", "quart", "quarter", "quash", "quat", "quaver", "quiver"]
                    })
    puzzles.push({ name: "R Words",
                     category: "Speech and Language",
                     words: ["rain", "raise", "ramble", "realistic", "reap", "recognize", "reconcile", "regal", "restore", "restrain", "ride", "ridiculous", "rise", "risk", "roar", "rotation", "round", "routine", "row", "rubber", "ruddy", "rude", "rumination", "rumor", "run"]
                    })
    puzzles.push({ name: "S Words",
                     category: "Speech and Language",
                     words: ["saturate", "scene", "schedule", "school", "science", "scoop", "sequel", "serve", "shadow", "significant", "slight", "slumber", "social", "sonorous", "speaker", "spontaneous", "squander", "square", "stage", "stagnant", "substance", "subtle", "success", "sufficient", "system"]
                    })
    puzzles.push({ name: "Short A Words",
                     category: "Speech and Language",
                     words: ["ant", "apple", "ash", "ask", "band", "can", "cat", "fan", "flash", "glad", "hand", "hat", "lack", "land", "mad", "mask", "pan", "quack", "sack", "sad", "sand", "smash", "splash", "stack", "tax"]
                    })
    puzzles.push({ name: "Short E Words",
                     category: "Speech and Language",
                     words: ["bed", "bent", "checked", "deck", "egg", "end", "excel", "fed", "hen", "jet", "leg", "lemon", "lend", "nest", "net", "rest", "set", "spell", "spend", "tell", "ten", "test", "vest", "web", "went"]
                    })
    puzzles.push({ name: "Short I Words",
                     category: "Speech and Language",
                     words: ["big", "bill", "dig", "dip", "fin", "fit", "gift", "igloo", "iguana", "inch", "kin", "kitten", "lip", "litter", "milk", "mitten", "pin", "pit", "ship", "silk", "sit", "slip", "spin", "stint", "win"]
                    })
    puzzles.push({ name: "Short O Words",
                     category: "Speech and Language",
                     words: ["cloth", "dock", "dog", "doll", "dolphin", "frog", "gone", "hog", "lock", "log", "long", "mop", "moth", "oblong", "octagon", "odd", "olive", "option", "ostrich", "pot", "robin", "smock", "smog", "sock", "stop"]
                    })
    puzzles.push({ name: "Short U Words",
                     category: "Speech and Language",
                     words: ["bug", "bus", "cuff", "cup", "drum", "dug", "fun", "fuss", "hum", "jug", "jump", "luck", "lump", "nut", "plus", "run", "stuck", "stump", "stun", "sun", "truck", "ugly", "umbrella", "uncle", "under"]
                    })
    puzzles.push({ name: "Silent Final E Words",
                     category: "Speech and Language",
                     words: ["bake", "bone", "cake", "date", "dive", "fake", "file", "fine", "gate", "hide", "hole", "home", "huge", "life", "none", "pale", "rake", "ride", "safe", "sale", "snake", "time", "wake", "whale", "while"]
                    })
    puzzles.push({ name: "T Words",
                     category: "Speech and Language",
                     words: ["tactic", "taint", "tally", "tardiness", "task", "taxing", "teacher", "team", "temper", "terminology", "thought", "tirade", "towering", "trade", "transfer", "transportation", "tribulation", "triumph", "truth", "try", "tuition", "turbulent", "tutor", "twine", "typical"]
                    })
    puzzles.push({ name: "U Words",
                     category: "Speech and Language",
                     words: ["ugly", "ulterior", "ultimate", "unabashed", "unaware", "unbearable", "unbelievable", "unbiased", "unclear", "uncomfortable", "unconditional", "unctuous", "undecided", "under", "underdog", "underground", "underline", "underneath", "understand", "undo", "undulate", "unearth", "unending", "unfair", "utter"]
                    })
    puzzles.push({ name: "V Words",
                     category: "Speech and Language",
                     words: ["vacant", "vacation", "vacuous", "vacuum", "vain", "valid", "valor", "valuable", "vanish", "vapor", "variable", "various", "vast", "vegetarian", "veil", "vest", "vicious", "view", "vigilant", "violin", "volunteer", "vote", "vouch", "vow", "vulnerable"]
                    })
    puzzles.push({ name: "W Words",
                     category: "Speech and Language",
                     words: ["wage", "wail", "wait", "wall", "wander", "weak", "weary", "welcome", "wheel", "wield", "willing", "winner", "wisdom", "wistful", "woeful", "work", "worthy", "wrapper", "wrath", "wreckage", "wrinkle", "writhe", "written", "wrong", "wry"]
                    })
    puzzles.push({ name: "Words Beginning With Ea",
                     category: "Speech and Language",
                     words: ["each", "eager", "eagle", "ear", "earl", "earliest", "earlobe", "early", "earn", "earnest", "earphone", "earpiece", "earplug", "earring", "earshot", "earth", "earthquake", "ease", "easel", "east", "eastern", "easy", "eat", "eaves", "eavesdrop"]
                    })
    puzzles.push({ name: "Words Beginning With Sn",
                     category: "Speech and Language",
                     words: ["snack", "snag", "snail", "snake", "snap", "snare", "snarl", "snatch", "sneak", "sneaker", "sneaky", "sneer", "sneeze", "snicker", "sniff", "snip", "snipe", "snivel", "snob", "snoop", "snore", "snorkel", "snort", "snow", "snuggle"]
                    })
    puzzles.push({ name: "Words Beginning With Tr",
                     category: "Speech and Language",
                     words: ["trace", "track", "trade", "trail", "train", "trait", "transit", "trap", "trauma", "tread", "treat", "trend", "triangle", "trick", "tried", "trim", "trolley", "trophy", "trouble", "trowel", "truce", "true", "trumpet", "trunk", "truth"]
                    })
    puzzles.push({ name: "Words Beginning With Au",
                     category: "Speech and Language",
                     words: ["August", "aubergine", "auburn", "auction", "audacious", "audacity", "audible", "audience", "audio", "audit", "audition", "augment", "aura", "aurora", "auspicious", "authentic", "author", "authority", "authorize", "autobiography", "autograph", "automatic", "automobile", "autumn", "auxiliary"]
                    })
    puzzles.push({ name: "Words Beginning With Bl",
                     category: "Speech and Language",
                     words: ["black", "blame", "blanch", "blank", "blanket", "blast", "blaze", "bleach", "bleak", "bleary", "bleat", "bleed", "blemish", "blend", "bless", "blew", "blind", "blink", "bliss", "blister", "block", "bloom", "blossom", "blot", "blue"]
                    })
    puzzles.push({ name: "Words Beginning With Br",
                     category: "Speech and Language",
                     words: ["brace", "bracket", "brag", "braid", "brain", "brake", "branch", "brand", "brass", "brave", "bray", "brazen", "breach", "bread", "break", "breath", "breeze", "bribe", "brick", "bridge", "bright", "brim", "bring", "broad", "broom"]
                    })
    puzzles.push({ name: "Words Beginning With Cl",
                     category: "Speech and Language",
                     words: ["clad", "claim", "clam", "clamp", "clan", "clank", "clap", "clarify", "class", "claw", "clay", "clean", "clear", "clench", "clerk", "clever", "click", "client", "cliff", "climate", "climb", "clock", "close", "cloud", "club"]
                    })
    puzzles.push({ name: "Words Beginning With Cr",
                     category: "Speech and Language",
                     words: ["crab", "crack", "craft", "crag", "cram", "crash", "creak", "crease", "create", "credit", "cricket", "crisp", "croak", "crock", "crop", "cross", "crouch", "crow", "crowd", "crown", "cruel", "cruise", "crumb", "crunch", "cry"]
                    })
    puzzles.push({ name: "Words Beginning With Dr",
                     category: "Speech and Language",
                     words: ["draft", "drag", "dragon", "dragonfly", "drain", "drama", "drape", "draw", "drawer", "dread", "dream", "dreary", "drench", "dress", "dresser", "drift", "drill", "drink", "drip", "drive", "drizzle", "droop", "drop", "drove", "dry"]
                    })
    puzzles.push({ name: "Words Beginning With Fl",
                     category: "Speech and Language",
                     words: ["flag", "flail", "flake", "flame", "flamingo", "flammable", "flannel", "flap", "flare", "flash", "flat", "flaw", "flee", "fleece", "fleet", "flesh", "flicker", "flight", "flinch", "float", "flock", "flood", "flop", "flounce", "flute"]
                    })
    puzzles.push({ name: "Words Beginning With Fr",
                     category: "Speech and Language",
                     words: ["fraction", "fragile", "frail", "frame", "fraud", "free", "freight", "frenzy", "frequent", "fresh", "fret", "friction", "friend", "frighten", "fringe", "frizz", "fro", "frog", "front", "frontier", "frost", "frown", "fruit", "frustrate", "fry"]
                    })
    puzzles.push({ name: "Words Beginning With Gl",
                     category: "Speech and Language",
                     words: ["glad", "glass", "glaze", "gleam", "glean", "glee", "glen", "glib", "glide", "glimmer", "glimpse", "glint", "glisten", "glitch", "glitter", "global", "globe", "gloomy", "glory", "gloss", "glove", "glow", "glower", "glue", "glum"]
                    })
    puzzles.push({ name: "Words Beginning With Gr",
                     category: "Speech and Language",
                     words: ["grab", "grace", "grade", "grain", "grammar", "grand", "grant", "grape", "grapple", "great", "greed", "green", "grid", "grief", "grill", "grim", "grind", "groan", "groom", "ground", "grow", "grueling", "gruff", "grumpy", "grunt"]
                    })
    puzzles.push({ name: "Words Beginning With Ph",
                     category: "Speech and Language",
                     words: ["pharmacy", "phase", "phenomenal", "phenomenon", "philosopher", "philosophical", "philosophy", "phlegm", "phobia", "phobic", "phone", "phonemic", "phonetic", "phonetically", "phonic", "phony", "phosphor", "phosphoric", "photo", "photograph", "phrase", "phylum", "physical", "physics", "physiology"]
                    })
    puzzles.push({ name: "Words Beginning With Pl",
                     category: "Speech and Language",
                     words: ["place", "plaid", "plain", "plan", "plane", "planet", "plantation", "plasma", "plate", "plateau", "play", "plea", "pleasant", "pledge", "plenty", "pliable", "plod", "plot", "plow", "pluck", "plug", "plum", "plume", "plummet", "plural"]
                    })
    puzzles.push({ name: "Words Beginning With Pr",
                     category: "Speech and Language",
                     words: ["practice", "praise", "prance", "prank", "pray", "preach", "precept", "precise", "precision", "predator", "preface", "prelude", "premise", "prepare", "present", "president", "press", "prey", "pride", "primary", "prince", "print", "priority", "process", "proper"]
                    })
    puzzles.push({ name: "Words Beginning With Sl",
                     category: "Speech and Language",
                     words: ["slack", "slam", "slant", "sled", "sleep", "sleet", "sleeve", "sleigh", "sleuth", "slew", "slice", "slick", "slight", "slimy", "slip", "slippery", "sliver", "slogan", "slope", "sloppy", "slow", "slug", "sluice", "slumber", "sly"]
                    })
    puzzles.push({ name: "Words Beginning With Sm",
                     category: "Speech and Language",
                     words: ["smack", "small", "smallpox", "smart", "smartly", "smash", "smatter", "smear", "smell", "smicker", "smidge", "smile", "smirk", "smitten", "smock", "smog", "smoke", "smokestack", "smoldering", "smooch", "smooth", "smudge", "smug", "smuggle", "smush"]
                    })
    puzzles.push({ name: "Words Beginning With Soft C Sound",
                     category: "Speech and Language",
                     words: ["ceiling", "celebrate", "celery", "celestial", "cell", "cellar", "cement", "cent", "center", "centipede", "certain", "cicada", "cinder", "cinnamon", "circle", "circuit", "circulate", "circus", "city", "civil", "civil", "cycle", "cyclone", "cylinder", "cymbal"]
                    })
    puzzles.push({ name: "Words Beginning With Sp",
                     category: "Speech and Language",
                     words: ["space", "spacious", "spade", "spaghetti", "span", "spar", "spark", "sparrow", "sparse", "spatial", "spatula", "spawn", "spay", "speaker", "spear", "special", "spectacle", "speculate", "speech", "speed", "spell", "spew", "spider", "spine", "spoke"]
                    })
    puzzles.push({ name: "Words Beginning With Squ",
                     category: "Speech and Language",
                     words: ["squab", "squabble", "squad", "squadron", "squall", "square", "squared", "squat", "squaw", "squawfish", "squawk", "squeak", "squeaky", "squeal", "squeamish", "squeeze", "squelch", "squid", "squint", "squire", "squirm", "squirred", "squirrel", "squirt", "squish"]
                    })
    puzzles.push({ name: "Words Beginning With St",
                     category: "Speech and Language",
                     words: ["stable", "stack", "stadium", "staff", "stage", "stagnant", "stain", "stairs", "stare", "start", "startle", "starve", "state", "statistics", "step", "stern", "sticker", "stiff", "stigma", "stock", "stocking", "stomach", "stone", "stop", "stuck"]
                    })
    puzzles.push({ name: "Words Containing AI",
                     category: "Speech and Language",
                     words: ["acclaim", "afraid", "bait", "brain", "campaign", "chain", "daily", "entail", "entertain", "faint", "frail", "gain", "grain", "hail", "maid", "nail", "ordain", "paisley", "praise", "quaint", "sail", "saint", "stain", "tail", "trail"]
                    })
    puzzles.push({ name: "Words Containing EA",
                     category: "Speech and Language",
                     words: ["appear", "appease", "beach", "beacon", "bead", "beak", "cease", "clean", "clear", "cleave", "cream", "defeat", "dream", "endear", "gleam", "grease", "heal", "lead", "leaf", "meal", "peace", "sneak", "steam", "teach", "treat"]
                    })
    puzzles.push({ name: "Words Containing EE",
                     category: "Speech and Language",
                     words: ["asleep", "beep", "beseech", "careen", "career", "cheek", "deed", "deem", "esteem", "exceed", "feeble", "greed", "heed", "heel", "indeed", "jeer", "keep", "leeway", "meek", "needle", "overseer", "peel", "proceed", "queen", "redeem"]
                    })
    puzzles.push({ name: "Words Containing OO",
                     category: "Speech and Language",
                     words: ["aloof", "balloon", "bloom", "book", "carpool", "cartoon", "choose", "cook", "drool", "flood", "foot", "good", "goose", "hoof", "hoot", "lagoon", "loose", "maroon", "noon", "proof", "room", "school", "took", "tooth", "wood"]
                    })
    puzzles.push({ name: "Words Ending In U",
                     category: "Speech and Language",
                     words: ["bandeau", "bayou", "beau", "caribou", "chateau", "coteau", "eau", "ecru", "emu", "flu", "frau", "gnu", "haiku", "impromptu", "jujitsu", "lieu", "luau", "menu", "milieu", "plateau", "thou", "tiramisu", "tofu", "tutu", "you"]
                    })
    puzzles.push({ name: "Words Ending In I",
                     category: "Speech and Language",
                     words: ["alibi", "alumni", "bikini", "bonsai", "broccoli", "chili", "confetti", "jacuzzi", "kiwi", "macaroni", "manicotti", "nuclei", "pepperoni", "rabbi", "safari", "salami", "samurai", "ski", "spaghetti", "sushi", "taxi", "tsunami", "vermicelli", "ziti", "zucchini"]
                    })
    puzzles.push({ name: "Words Ending In SS",
                     category: "Speech and Language",
                     words: ["business", "careless", "clueless", "congress", "cordless", "countless", "darkness", "distress", "fearless", "flawless", "fortress", "goodness", "harmless", "helpless", "highness", "holiness", "homeless", "hopeless", "kindness", "laziness", "lifeless", "mattress", "mindless", "princess", "progress"]
                    })
    puzzles.push({ name: "Words Ending In The F Sound",
                     category: "Speech and Language",
                     words: ["aloof", "beef", "calf", "chef", "chief", "cliff", "giraffe", "golf", "graph", "half", "knife", "laugh", "leaf", "off", "poof", "reef", "roof", "shelf", "sniff", "spoof", "staff", "surf", "thief", "turf", "wolf"]
                    })
    puzzles.push({ name: "Words Ending In Y",
                     category: "Speech and Language",
                     words: ["apply", "beauty", "boy", "by", "employ", "fancy", "happy", "hurry", "library", "lovely", "marry", "mercy", "ordinary", "portray", "pray", "puppy", "relay", "sky", "stay", "study", "supply", "toy", "valley", "vary", "why"]
                    })
    puzzles.push({ name: "Words Ending With J Sound",
                     category: "Speech and Language",
                     words: ["age", "badge", "cage", "courage", "edge", "forge", "gauge", "gorge", "hedge", "huge", "image", "ledge", "lodge", "merge", "message", "page", "porridge", "range", "ridge", "siege", "stage", "storage", "strange", "wage", "wedge"]
                    })
    puzzles.push({ name: "Words Ending With L Sound",
                     category: "Speech and Language",
                     words: ["apple", "ball", "bell", "bicycle", "candle", "circle", "doll", "eagle", "girl", "mail", "motorcycle", "nail", "pencil", "pickle", "purple", "puzzle", "sandal", "school", "seal", "shovel", "table", "triangle", "turtle", "waffle", "whale"]
                    })
    puzzles.push({ name: "Words Ending With Ous",
                     category: "Speech and Language",
                     words: ["ambiguous", "ambitious", "boisterous", "cantankerous", "carnivorous", "chivalrous", "dangerous", "delicious", "enormous", "ferocious", "furious", "glorious", "hazardous", "impervious", "joyous", "judicious", "meticulous", "notorious", "nutritious", "obnoxious", "perilous", "serious", "tedious", "vicious", "wonderous"]
                    })
    puzzles.push({ name: "Words Ending in EE",
                     category: "Speech and Language",
                     words: ["absentee", "agree", "bee", "carefree", "chimpanzee", "coffee", "committee", "degree", "employee", "fee", "filigree", "frisbee", "glee", "jamboree", "knee", "levee", "manatee", "nominee", "pedigree", "refugee", "see", "three", "trainee", "tree", "trustee"]
                    })
    puzzles.push({ name: "Words Ending in IE",
                     category: "Speech and Language",
                     words: ["auntie", "bain marie", "birdie", "bourgeoisie", "brie", "brownie", "calorie", "camaraderie", "charcuterie", "collie", "cookie", "coterie", "eerie", "indie", "lingerie", "menagerie", "patisserie", "pie", "prairie", "preemie", "reverie", "rotisserie", "smoothie", "tie", "underlie"]
                    })
    puzzles.push({ name: "Words That Begin With Sh",
                     category: "Speech and Language",
                     words: ["chef", "shack", "shake", "shallow", "shampoo", "shamrock", "shard", "share", "shark", "shaver", "she", "sheep", "shelf", "shell", "shin", "ship", "shirt", "shoes", "shop", "shore", "shot", "shoulder", "shovel", "shower", "shun"]
                    })
    puzzles.push({ name: "Words That Begin With Th",
                     category: "Speech and Language",
                     words: ["Thanksgiving", "Thursday", "that", "the", "then", "there", "thermos", "these", "thick", "thigh", "thin", "think", "third", "thirsty", "thirty", "this", "those", "though", "thread", "three", "throat", "throne", "throw", "thumb", "thunder"]
                    })
    puzzles.push({ name: "Words That End With Sh Sounds",
                     category: "Speech and Language",
                     words: ["blush", "brush", "bush", "cash", "crash", "crush", "dash", "dish", "eyelash", "fish", "flash", "flush", "foolish", "leash", "moustache", "mush", "polish", "push", "radish", "squash", "squish", "toothbrush", "trash", "wash", "wish"]
                    })
    puzzles.push({ name: "Words That End With The Z Sound",
                     category: "Speech and Language",
                     words: ["bananas", "boughs", "bows", "boys", "breeze", "cheese", "cherries", "choose", "close", "cookies", "cows", "eyes", "freeze", "keys", "ladies", "lies", "news", "noise", "nose", "peas", "rose", "shoes", "sneeze", "ties", "toys"]
                    })
    puzzles.push({ name: "Words With G Sound at the End",
                     category: "Speech and Language",
                     words: ["bag", "big", "bug", "dig", "dog", "egg", "flag", "fog", "frog", "hog", "hug", "leg", "log", "mug", "pig", "plug", "rag", "rug", "smog", "snag", "tag", "tug", "twig", "wag", "wig"]
                    })
    puzzles.push({ name: "Words With Ch At The End",
                     category: "Speech and Language",
                     words: ["arch", "batch", "beach", "bench", "bunch", "catch", "church", "couch", "each", "hatch", "latch", "lunch", "march", "match", "ostrich", "patch", "peach", "punch", "sandwich", "speech", "spinach", "teach", "touch", "watch", "wrench"]
                    })
    puzzles.push({ name: "Words With Ch In The Beginning",
                     category: "Speech and Language",
                     words: ["chaff", "chain", "chair", "chalk", "chase", "cheat", "check", "checkers", "cheer", "cheese", "cherry", "chew", "chick", "chicken", "child", "children", "chill", "chimney", "chin", "chip", "chocolate", "choose", "chop", "church", "churn"]
                    })
    puzzles.push({ name: "Words With G Sound In The Middle",
                     category: "Speech and Language",
                     words: ["August", "English", "Pilgrim", "Thanksgiving", "agree", "angry", "argue", "baggage", "bargain", "begin", "biggest", "digging", "eager", "figure", "finger", "forget", "hungry", "kangaroo", "kindergarten", "legal", "luggage", "program", "regular", "target", "wiggle"]
                    })
    puzzles.push({ name: "Words With Ie And Ei",
                     category: "Speech and Language",
                     words: ["achieve", "belief", "believe", "brief", "ceiling", "chief", "conceit", "deceit", "deceive", "eight", "foreign", "leisure", "neighbor", "perceive", "quiet", "receipt", "receive", "reign", "retrieve", "science", "their", "their", "weigh", "weight", "yield"]
                    })
    puzzles.push({ name: "Words With Ity",
                     category: "Speech and Language",
                     words: ["ability", "authority", "brutality", "conformity", "density", "facility", "finality", "gravity", "humidity", "identity", "infinity", "legality", "liability", "necessity", "nobility", "obscurity", "oddity", "propensity", "quality", "quantity", "reliability", "security", "sensitivity", "validity", "visibility"]
                    })
    puzzles.push({ name: "Words With J Sound In The Middle",
                     category: "Speech and Language",
                     words: ["angel", "danger", "detergent", "emergency", "fragile", "graduate", "injury", "intelligent", "magic", "magician", "major", "margarine", "messenger", "object", "oxygen", "pages", "pajamas", "passenger", "pigeon", "project", "religion", "soldier", "stranger", "teenager", "vegetable"]
                    })
    puzzles.push({ name: "Words With K Sound At The End",
                     category: "Speech and Language",
                     words: ["back", "bake", "bike", "book", "brick", "broke", "chalk", "dock", "fake", "lack", "lake", "lick", "like", "lock", "look", "notebook", "rake", "sack", "shake", "snowflake", "sock", "stick", "take", "thick", "took"]
                    })
    puzzles.push({ name: "Words With K Sound In The Middle",
                     category: "Speech and Language",
                     words: ["accept", "account", "acorn", "baker", "bicycle", "bobcat", "breakfast", "chicken", "cracker", "donkey", "income", "jacket", "lucky", "monkey", "napkin", "pumpkin", "raincoat", "rocket", "soccer", "speaker", "stocking", "turkey", "uncle", "vaccine", "weekend"]
                    })
    puzzles.push({ name: "Words With L In The Middle",
                     category: "Speech and Language",
                     words: ["Halloween", "alligator", "bracelet", "broccoli", "calendar", "caterpillar", "celery", "chili", "dollar", "elephant", "eyelash", "gorilla", "helicopter", "necklace", "olive", "polar", "police", "ruler", "skeleton", "stapler", "television", "umbrella", "violin", "volleyball", "watermelon"]
                    })
    puzzles.push({ name: "Words With S Sound At The End",
                     category: "Speech and Language",
                     words: ["address", "boss", "bus", "caboose", "cactus", "class", "dress", "erase", "face", "fence", "fireplace", "house", "lettuce", "moose", "mouse", "necklace", "nurse", "price", "race", "rice", "thermos", "tortoise", "us", "vase", "yes"]
                    })
    puzzles.push({ name: "Words With S Sound In The Middle",
                     category: "Speech and Language",
                     words: ["acid", "aside", "beside", "blossom", "cassette", "castle", "classroom", "dancer", "decide", "essay", "fossil", "glasses", "insect", "lesson", "listen", "messy", "muscle", "officer", "outside", "pencil", "proceed", "receive", "recent", "recite", "whistle"]
                    })
    puzzles.push({ name: "Words With Soft C Sounds",
                     category: "Speech and Language",
                     words: ["advance", "balance", "brace", "concept", "dance", "difference", "distance", "excel", "face", "finance", "grace", "instance", "intercept", "juice", "notice", "pace", "peace", "precept", "sentence", "slice", "space", "success", "trace", "truce", "voice"]
                    })
    puzzles.push({ name: "Words With Th In The Middle",
                     category: "Speech and Language",
                     words: ["anything", "athlete", "author", "bathrobe", "bathroom", "bathtub", "birthday", "earthquake", "faithful", "filthy", "healthy", "lengthen", "mathematics", "monthly", "mothball", "mouthful", "mouthing", "nothing", "pathway", "python", "something", "toothache", "toothbrush", "toothpaste", "wealthy"]
                    })
    puzzles.push({ name: "Words With Y As Vowel",
                     category: "Speech and Language",
                     words: ["Egypt", "acronym", "acronym", "amethyst", "analysis", "analytic", "anonymous", "catalyst", "chlorophyll", "crystal", "cynical", "cyst", "gym", "idyll", "mystery", "myth", "onyx", "physics", "rhythm", "syllable", "synchronize", "synonym", "synthesis", "synthetic", "typical"]
                    })
    puzzles.push({ name: "Words With ZZ",
                     category: "Speech and Language",
                     words: ["blizzard", "buzzard", "dazzle", "dizzy", "drizzle", "embezzle", "fizzle", "frazzle", "frizzy", "fuzzy", "gizzard", "grizzly", "jacuzzi", "jazz", "mezzanine", "mozzarella", "muzzle", "nozzle", "nuzzle", "pizza", "pizzeria", "puzzle", "quizzical", "sizzling", "whizzed"]
                    })
    puzzles.push({ name: "X Words",
                     category: "Speech and Language",
                     words: ["Xeriscape", "Xylocarpous", "x-axis", "x-ray", "xanthic", "xenium", "xenolith", "xenon", "xenophobic", "xenopus", "xerarch", "xeric", "xerodermia", "xerography", "xerotes", "xylographs", "xylophage", "xylophone", "xyloplastic", "xylose", "xylosma", "xylotomy", "xyris", "xyst", "xyster"]
                    })
    puzzles.push({ name: "Y Words",
                     category: "Speech and Language",
                     words: ["yacht", "yap", "yard", "yardstick", "yarn", "yawn", "year", "yearend", "yearn", "yeast", "yell", "yellow", "yelp", "yen", "yes", "yesterday", "yet", "yield", "yoke", "yore", "young", "your", "youth", "youthful", "yowl"]
                    })
    puzzles.push({ name: "Z Words",
                     category: "Speech and Language",
                     words: ["zany", "zeal", "zealot", "zealous", "zebra", "zenith", "zephyr", "zero", "zest", "zigzag", "zinc", "zipcode", "zipper", "zirconium", "zodiac", "zombie", "zone", "zoned", "zoo", "zoology", "zoom", "zooplankton", "zucchini", "zygote", "zymotic"]
                    })
    puzzles.push({ name: "Algeria World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Abdelakder Laifaoui", "Abdelakder Laifaoui ", "Abdelkader Ghezzal", "Adlene Guidoura", "Antar Yahia", "Carl Medjani ", "Djamel Abdoun", "Djamel Mesbah", "Faouzi Chaouchi ", "Foued Kadir ", "Habib Belaid", "Hassan Yebda", "Karim Matmour", "Karim Ziani ", "Lounes Gaouaoui ", "Madjid Bougherra", "Medhi Lacen", "Nadir Belhadj", "Rabah Saadane", "Rafik Djebbour", "Rafik Halliche ", "Rafik Saifi", "Riad Boudebouz", "Yazid Mansouri"]
                    })
    puzzles.push({ name: "Argentina World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Angel Di Maria ", "Argentina", "Argentina", "Ariel Garce", "Carlos Tevez ", "Clemente Rodriguez ", "Diego Milito ", "Diego Pozo", "Gabriel Heinze ", "Gonzalo Higuain  ", "Javier Mascherano ", "Javier Pastore", "Jonas Gutierrez  ", "Juan Sebastian Veron  ", "Lionel Messi", "Mariano Andujar ", "Mario Bolatti  ", "Martin Demichelis  ", "Martin Palermo ", "Nicolas Burdisso ", "Nicolas Otamendi ", "Sergio Aguero  ", "Sergio Romero ", "Walter Samuel "]
                    })
    puzzles.push({ name: "Australia World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Adam Federici", "Australia", "Brad Jones ", "Brett Emerton", "Brett Holman", "Carl Valeri", "Craig Moore", "Dario Vidosic ", "David Carney", "Harry Kewell ", "Jason Culina", "Joshua Kennedy", "Lucas Neill ", "Luke Wilkshire", "Mark Bresciano ", "Mark Milligan", "Mark Schwarzer", "Michael Beauchamp", "Mile Jedinak", "Nikita Rukavytsya", "Pim Verbeek ", "Richard Garcia", "Scott Chipperfield", "Tim Cahill", "Vince Grella"]
                    })
    puzzles.push({ name: "Baseball",
                     category: "Sports",
                     words: ["baseball diamond", "bases loaded", "batter", "bunt", "catcher", "fielders", "first base", "fly ball", "foul", "ground ball", "hit", "home run", "infield", "innings", "outfield", "outs", "pinch hitter", "pitch", "second base", "strike", "strike zone", "third base", "umpire", "walk"]
                    })
    puzzles.push({ name: "Baseball Hall of Fame",
                     category: "Sports",
                     words: ["Al Simmons", "Babe Ruth", "Bill Terry", "Bobby Wallace", "Cap Anson", "Chief Bender", "Cy Young", "Dan Brouthers", "Dazzy Vance", "Dizzy Dean", "Ed Walsh", "Frank Chance", "Hugh Duffy", "Joe Cronin", "Joe DiMaggio", "Joe Tinker", "Kid Nichols", "Lefty Grove", "Lou Gehrig", "Mel Ott", "Paul Waner", "Ted Lyons", "Ty Cobb", "Walter Johnson", "Willie Keeler"]
                    })
    puzzles.push({ name: "Baseball Hall of Fame 2",
                     category: "Sports",
                     words: ["Billy Evans", "Bob Feller", "Buck Leonard", "Chick Hafey", "Earle Combs", "Goose Goslin", "Jackie Robinson", "Jesse Haines", "Joe Kelley", "John Ward", "Lefty Gomez", "Luke Appling", "Monte Irvin", "Red Ruffing", "Roberto Clemente", "Ross Youngs", "Roy Campanella", "Sam Crawford", "Sam Rice", "Sandy Koufax", "Satchel Paige", "Ted Williams", "Tim Keefe", "Yogi Berra", "Zack Wheat"]
                    })
    puzzles.push({ name: "Baseball Hall of Fame 3",
                     category: "Sports",
                     words: ["Brooks Robinson", "Cal Hubbard", "Catfish Hunter", "Cool Papa Bell", "Don Drysdale", "Ernie Banks", "Hack Wilson", "Hank Aaron", "Hoyt Wilhelm", "Jim Palmer", "Joe Morgan", "Johnny Bench", "Juan Marichal", "Lou Brock", "Luis Aparicio", "Mickey Mantle", "Oscar Charleston", "Pop Lloyd", "Ray Dandridge", "Sam Thompson", "Tony Lazzeri", "Travis Jackson", "Whitley Ford", "Willie Mays", "Willie Stargell"]
                    })
    puzzles.push({ name: "Baseball Hall of Fame 4",
                     category: "Sports",
                     words: ["Bill McGowan", "Bruce Sutter", "Bullet Rogan", "Cal Ripken", "Carlton Fisk", "Dennis Eckersley", "Gary Carter", "Hilton Smith", "Joe Williams", "Jose Mendez", "Kirby Puckett", "Mule Suttles", "Nellie Fox", "Nolan Ryan", "Orlando Cepeda", "Ray Brown", "Reggie Jackson", "Rich Gossage", "Steve Carlton", "Tom Seaver", "Tony Gwynn", "Tony Perez", "Vic Willis", "Wade Boggs", "Willie Wells"]
                    })
    puzzles.push({ name: "Baseball Pitchers",
                     category: "Sports",
                     words: ["Bob Feller", "Bob Gibson", "Burleigh Grimes", "Carl Hubbell", "Christy Mathewson", "Early Wynn", "Eppa Rixey", "Ferguson Jenkins", "Gus Weyhing", "Jack Morris", "Jamie Moyer", "Jim Kaat", "Jim Palmer", "Mickey Welch", "Mike Mussina", "Old Hoss Radbourn", "Phil Niekro", "Pud Galvin", "Red Faber", "Red Ruffing", "Robin Roberts", "Tom Seaver", "Tommy John", "Tony Mullane", "Vic Willis"]
                    })
    puzzles.push({ name: "Baseball Teams",
                     category: "Sports",
                     words: ["Atlanta Braves", "Baltimore Orioles", "Boston Red Sox", "Chicago Cubs", "Chicago White Sox", "Cincinnati Reds", "Cleveland Indians", "Colorado Rockies", "Detroit Tigers", "Houston Astros", "Kansas City Royals", "Minnesota Twins", "New York Mets", "New York Yankees", "Pittsburgh Pirates", "San Diego Padres", "San Francisco Giants", "Seattle Mariners", "Texas Rangers", "Toronto Blue Jays"]
                    })
    puzzles.push({ name: "Basketball",
                     category: "Sports",
                     words: ["air ball", "assist", "block", "box out", "charge", "defense", "double dribble", "dribble", "dunk", "fast break", "free throw", "guard", "hack", "hold", "man-to-man", "offense", "pass", "pivot", "rebound", "shoot", "traveling", "turn over", "zone defense"]
                    })
    puzzles.push({ name: "Bowling",
                     category: "Sports",
                     words: ["alley", "approach", "backup ball", "blind score", "blocking", "blow", "creeper", "curve ball", "deadwood", "four bagger", "frame", "graveyard", "gutter", "gutter ball", "head pin", "kickbacks", "lane bed", "lofting", "mixer", "nose", "open frame", "perfect game", "rake", "spare", "strike"]
                    })
    puzzles.push({ name: "Bowling 2",
                     category: "Sports",
                     words: ["Hambone", "baby split", "bucket", "channel", "dead ball", "delivery", "double", "hook", "leave", "lift", "pin deck", "pushaway", "sandbagging", "scratch", "six pack", "sleeper", "stiff lane", "strike out", "thin hit", "throwing rocks", "turkey", "vacancy", "washout", "working ball"]
                    })
    puzzles.push({ name: "Boxing Champions",
                     category: "Sports",
                     words: ["Bob Fitzsimmons", "Ernie Terrell", "Ezzard Charles", "Floyd Patterson", "Gene Tunney", "Ingemar Johansson", "Jack Dempsey", "Jack Johnson", "Jack Sharkey", "James Braddock", "James Corbett", "James Jeffries", "Jersey Joe Walcott", "Jess Willard", "Joe Louis", "John Sullivan", "Lee Savold", "Marvin Hart", "Max Baer", "Max Schmeling", "Muhammad Ali", "Primo Carnera", "Rocky Marciano", "Sonny Liston", "Tommy Burns"]
                    })
    puzzles.push({ name: "Boxing Champions 2",
                     category: "Sports",
                     words: ["Evander Holyfield", "Francesco Damiani", "George Foreman", "Gerrie Coetzee", "Greg Page", "James Douglas", "James Smith", "Jimmy Ellis", "Joe Frazier", "John Tate", "Ken Norton", "Larry Holmes", "Leon Spinks", "Michael Dokes", "Michael Moorer", "Michael Spinks", "Mike Tyson", "Mike Weaver", "Pinklon Thomas", "Ray Mercer", "Riddick Bowe", "Time Witherspoon", "Tony Tubbs", "Tony Tucker", "Trevor Berbick"]
                    })
    puzzles.push({ name: "Boxing Champions 3",
                     category: "Sports",
                     words: ["Bruce Seldon", "Chris Byrd", "Corrie Sanders", "Frank Bruno", "Hasim Rahman", "Henry Akinwande", "Herbie Hide", "John Ruiz", "Lamon Brewster", "Lennox Lewis", "Michael Bentt", "Nikolay Valuev", "Nikolay Valuev", "Oleg Maskaev", "Oliver McCall", "Riddick Bowe", "Ruslan Chagaev", "Samuel Peter", "Sergei Liakhovich", "Shannon Briggs", "Sultan Ibragimov", "Tommy Morrison", "Vitali Klitschko", "Wladimir Klitschko"]
                    })
    puzzles.push({ name: "Brazil World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Brazil", "Dani Alves  ", "Doni", "Dunga", "Elano  ", "Felipe Melo ", "Gilberto  ", "Gilberto Silva  ", "Grafite", "Heurelho Gomes", "Josue ", "Juan  ", "Julio Baptista ", "Julio Cesar", "Kaka ", "Kleberson  ", "Lucio  ", "Luis Fabiano  ", "Luisao ", "Maicon  ", "Michel Bastos", "Nilmar ", "Ramires", "Robinho  ", "Thiago Silva  "]
                    })
    puzzles.push({ name: "California Half Marathons ",
                     category: "Sports",
                     words: ["Avenue of the Vines", "Bidwell Classic", "Big Sur", "Buffalo Run", "California Gold Rush", "Camp Pendleton", "Davis Stampede", "Death Valley Borax", "Disneyland", "Eye-Q Two Cities", "Four Bridges", "Grape Stomp", "La Jolla", "Lake Tahoe", "Love Your Heart", "Napa Valley Trail", "Run the Dove", "See Jane Run", "Surf City", "Tough as Granite", "Valley of the Flowers"]
                    })
    puzzles.push({ name: "California Half Marathons 2",
                     category: "Sports",
                     words: ["Artichoke ", "Bear Creek Trail", "Carlsbad California", "Hope in Motion", "Lake Casitas", "Modesto Midnight", "Morgan Hill", "Ojai Valley", "Orange County", "Palm Springs", "Pasadena", "River City", "Rose Bowl", "San Dieguito", "Silver Strand", "The Jungle Run", "Three Bridges", "Valley Crest"]
                    })
    puzzles.push({ name: "California Half Marathons 3",
                     category: "Sports",
                     words: ["Avenue of the Giants", "City to the Sea", "Diamond Valley Lake", "End of the Trail", "Going Bananas", "Golden Gate", "Hernia Hill", "Humboldt Redwoods", "Lake Merced", "Marin County", "Mount Diablo", "Palos Verdes", "Pier to Peak", "Salinas Valley", "San Francisco", "Santa Clarita", "Santa Cruz", "Santa Rosa", "Stockton", "Wine Vine"]
                    })
    puzzles.push({ name: "Cameroon World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Achille Emana  ", "Achille Webo", "Alexandre Song", "Aurelien Chedjou  ", "Benoit Assou Ekotto  ", "Cameroon", "Enoh Eyong  ", "Eric Choupo-Mating  ", "Gaetan Bong  ", "Georges Mandjeck  ", "Geremi  ", "Hamidou Souleymanou", "Idriss Carlos Kameni  ", "Jean Makoun  ", "Joel Matip  ", "Landry Nguemo  ", "Mohamadou Idrissou  ", "Nicolas Nkoulou  ", "Paul Le Guen ", "Rigobert Song", "Sebastien Bassong  ", "Stephane Mbia  ", "Vincent Aboubacar  "]
                    })
    puzzles.push({ name: "Chile World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Alexis Sanchez  ", "Arturo Vidal", "Carlos Carmona ", "Chile", "Claudio Bravo ", "Esteban Paredes  ", "Fabian Orellana  ", "Gary Medel ", "Gonzalo Fierro  ", "Gonzalo Jara  ", "Humberto Suazo", "Ismael Fuentes  ", "Jorge Valdivia", "Juan Beausejour  ", "Luis Marin ", "Marcelo Bielsa ", "Marco Estrada  ", "Mark Gonzalez  ", "Matias Fernandez  ", "Mauricio Isla ", "Miguel Pinto  ", "Pablo Contreras", "Rodrigo Millar ", "Rodrigo Tello ", "Waldo Ponce "]
                    })
    puzzles.push({ name: "Denmark World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Christian Poulsen", "Daniel Agger ", "Daniel Jensen ", "Denmark", "Dennis Rommedah", "Jakob Poulsen ", "Jesper Christiansen ", "Jesper Gronkjaer ", "Jon Dahl Tomasson ", "Lars Jacobsen ", "Martin Jorgensen ", "Mikkel Beckmann ", "Morten Olsen ", "Nicklas Bendtner ", "Patrick Mtiliga ", "Per Kroldrup ", "Simon Busk Poulsen ", "Simon Kjaer ", "Soren Larsen", "Stephan Andersen ", "Thomas Enevoldsen ", "Thomas Kahlenberg "]
                    })
    puzzles.push({ name: "England World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Aaron Lennon", "Ashley Cole", "David James", "Emile Heskey", "England", "Fabio Capello", "Frank Lampard ", "Gareth Barry", "Glen Johnson", "James Milner", "Jamie Carragher", "Jermain Defoe", "Joe Cole ", "Joe Hart", "John Terry", "Ledley King ", "Matthew Upson", "Michael Carrick", "Michael Dawson ", "Peter Crouch", "Robert Green", "Stephen Warnock", "Steven Gerrard", "Wayne Rooney"]
                    })
    puzzles.push({ name: "Famous Basketball Players",
                     category: "Sports",
                     words: ["Bill Russell", "Bill Walton", "Bob Pettit", "Charles Barkley", "Chris Webber", "Earl Monroe", "Elgin Baylor", "George Mikan", "Isaiah Thomas", "Jerry West", "John Havlicek", "Julius Erving", "Kareem Abdul-Jabbar", "Kobe Bryant", "Michael Jordan", "Mike Bibby", "Oscar Robertson", "Sam Jones", "Scottie Pippen", "Steve Francis", "Tony Parker", "Walt Bellamy", "Wilt Chamberlain", "Yao Ming"]
                    })
    puzzles.push({ name: "Female Figure Skaters",
                     category: "Sports",
                     words: ["Claudia Leistner", "Debi Thomas", "Dorothy Hamill", "Ekaterina Gordeeva", "Emily Hughes", "Jamie Sale", "Janet Lynn", "Jennifer Kirk", "Jill Trenary", "Katerina Witt", "Kristi Yamaguchi", "Manuela Ruben", "Michelle Kwan", "Nancy Kerrigan", "Oksana Baiul", "Peggy Fleming", "Petra Burka", "Rosalyn Sumner", "Sarah Hughes", "Sasha Cohen", "Skylar Cordell", "Tai Babilonia", "Tara Lipinski", "Tonya Harding", "Yuka Sato"]
                    })
    puzzles.push({ name: "Female Tennis Stars",
                     category: "Sports",
                     words: ["Althea Gibson", "Amelie Mauresmo", "Ana Ivanovic", "Anna Kournikova", "Billie Jean King", "Charlotte Cooper", "Chris Evert", "Dinara Safina", "Jelena Dokic", "Jennifer Capriati", "Kim Clijsters", "Lindsay Davenport", "Lottie Dod", "Maria Bueno", "Maria Sharapova", "Martina Hingis", "Martina Navratilova", "Mary Pierce", "Monica Seles", "Nadia Petrova", "Serena Williams", "Steffi Graf", "Tracy Austin", "Venus Williams"]
                    })
    puzzles.push({ name: "Football",
                     category: "Sports",
                     words: ["blocking", "center", "cornerback", "defense", "field goal", "first and ten", "fourth down", "fullback", "fumble", "halfback", "holding", "incomplete pass", "interception", "linebacker", "offense", "out-of-bounds", "pass interference", "penalty", "punt", "quarterback", "sack", "tackle", "tight end", "wide receiver", "yards"]
                    })
    puzzles.push({ name: "France World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Abou Diaby ", "Alou Diarra ", "Andre-Pierre Gignac ", "Anthony Reveillere ", "Bacary Sagna ", "Cedric Carrasso  ", "Djibril Cisse ", "Eric Abidal ", "Florent Malouda ", "France", "Franck Ribery  ", "Gael Clichy", "Hugo Lloris ", "Jeremy Toulalan ", "Marc Planus ", "Mathieu Valbuena", "Nicolas Anelka ", "Patrice Evra  ", "Raymond Domenech ", "Sebastien Squillaci ", "Sidney Govou ", "Steve Mandanda ", "Thierry Henry ", "William Gallas ", "Yoann Gourcuff "]
                    })
    puzzles.push({ name: "Germany World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Arne Friedrich", "Cacau ", "Dennis Aogo", "Germany", "Holger Badstuber", "Joachim Low", "Lukas Podolski", "Manuel Neuer", "Marcell Jansen", "Marko Marin", "Miroslav Klose", "Per Mertesacker", "Philipp Lahm", "Piotr Trochowski ", "Sami Khedira", "Serdar Tasci", "Stefan Kiessling", "Tim Wiese", "Toni Kroos"]
                    })
    puzzles.push({ name: "Ghana World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Anthony Annan ", "Asamoah Gyan", "Daniel Adjei", "Dede Ayew", "Derek Boateng ", "Dominic Adiyiah", "Ghana", "Hans Sarpei", "Isaac Vorsah ", "John Mensah", "John Pantsil", "Jonathan Mensah", "Kevin-Prince Boateng", "Kwadwo Asamoah", "Lee Addy", "Matthew Amoah", "Milovan Rajevac ", "Prince Tagoe ", "Quincy Owusu-Abeyie", "Rahim Ayew", "Richard Kingston", "Samuel Inkoom", "Stephen Ahorlu ", "Stephen Appiah", "Sulley Muntari "]
                    })
    puzzles.push({ name: "Golf Terms",
                     category: "Sports",
                     words: ["ace", "back nine", "best ball", "birdie", "bogey", "bunker", "chip shot", "divot", "double bogey", "double eagle", "downhill lie", "duff", "eagle", "fairway", "fore", "front nine", "gimme", "handicap", "hook shot", "iron", "lie", "mulligan", "putting green", "stroke", "tee"]
                    })
    puzzles.push({ name: "Golf: PGA Players 1",
                     category: "Sports",
                     words: ["Aaron Baddeley", "Arjun Atwal", "Billy Andrade", "Brad Adamonis", "Brian Bateman", "Briny Baird", "Cameron Beckman", "Craig Barlow", "Eric Axley", "Ian Baker-Finch", "Matt Bettencourt", "Michael Allen", "Notah Begay III", "Paul Azinger", "Rich Beem", "Ricky Barnes", "Robert Allenby", "Shane Bertsch", "Stephen Ames", "Steve Allan", "Stuart Appleby", "Tommy Armour III", "Tyler Aldridge", "Woody Austin"]
                    })
    puzzles.push({ name: "Golf: PGA Players 10",
                     category: "Sports",
                     words: ["Adam Scott", "Andres Romero", "Bob Sowards", "Brandt Snedeker", "Chris Smith", "Chris Stroud", "Darron Stiles", "Heath Slocum", "Joey Snyder III", "John Senden", "Justin Rose", "Kevin Stadler", "Kevin Streelman", "Kevin Sutherland", "Patrick Sheehan", "Paul Stankowski", "Phil Tataurangi", "Rory Sabbatini", "Scott Sterling", "Stever Stricker", "Ted Schulz", "Tom Scherrer", "Vijay Singh", "Webb Simpson"]
                    })
    puzzles.push({ name: "Golf: PGA Players 11",
                     category: "Sports",
                     words: ["Aaron Watkins", "Bo Van Pelt", "Bob Tway", "Boo Weekley", "Brendon Todd", "Brett Wetterich", "Brian Vranesh", "Bubby Watson", "Camilo Villegas", "Casey Wittenberg", "Charles Warren", "Charlie Wi", "David Toms", "Dean Wilson", "Duffy Waldorf", "Garrett Willis", "Gary Woodland", "Grant Waite", "Jay Williamson", "Jimmy Walker", "Johnson Wagner", "Kirk Triplett", "Marc Turnesa", "Mark Wilson", "Mike Weir", "Nicholas Thompson", "Nick Watney", "Omar Uresti", "Peter Tomasulo", "Roland Thatcher", "Scott Verplank", "Tiger Woods", "Tim Wilkinson", "Vaughn Taylor", "Willie Wood"]
                    })
    puzzles.push({ name: "Golf: PGA Players 2",
                     category: "Sports",
                     words: ["Alex Cejka", "Andrew Buckle", "Angel Cabrera", "Bart Bryant", "Billy Ray Brown", "Brandel Chamblee", "Chad Campbell", "Curt Byrum", "Daniel Chopra", "Eamonn Brady", "Greg Chalmers", "Guy Boros", "Jason Bohn", "Jonathan Byrd", "Kris Blanks", "Mark Brooks", "Mark Calcavecchia", "Matthew Borchert", "Michael Bradley", "Olin Browne", "Paul Casey", "Ronnie Black", "Stewart Cink", "Tom Byrum"]
                    })
    puzzles.push({ name: "Golf: PGA Players 3",
                     category: "Sports",
                     words: ["Ben Crane", "Ben Curtis", "Bob Estes", "Brendon de Jonge", "Brian Davis", "Chris Couch", "Chris DiMarco", "David Duval", "Ernie Els", "Fred Couples", "Glen Day", "James Driscoll", "Jason Day", "Jason Dufner", "Jay Delsing", "Joe Durant", "John Daly", "Jose Coceres", "Ken Duke", "Kris Cox", "Luke Donald", "Marco Dawson", "Robert Damron", "Steve Elkington", "Tim Clark", "Wil Collins"]
                    })
    puzzles.push({ name: "Golf: PGA Players 4",
                     category: "Sports",
                     words: ["Brad Faxon", "Brent Geiberger", "Brian Gay", "Carlos Franco", "David Feherty", "Derek Fathauer", "Fred Funk", "Harrison Frazar", "Jason Gore", "Jim Furyk", "Lucas Glover", "Mathias Gronberg", "Matt Gogel", "Matthew Goggin", "Nathan Green", "Nick Faldo", "Paul Goydos", "Retief Goosen", "Rick Fehr", "Robert Gamez", "Robert Garrigus", "Sergio Garcia", "Steve Flesch", "Tommy Gainey"]
                    })
    puzzles.push({ name: "Golf: PGA Players 6",
                     category: "Sports",
                     words: ["Anthony Kim", "Cliff Kresge", "Colt Knost", "Craig Kanada", "Doug LaBelle II", "Greg Kraft", "Hank Kuehne", "Ian Leggatt", "Jeff Klauk", "Jerry Kelly", "Jonathan Kaye", "Justin Leonard", "Kent Jones", "Marc Leishman", "Martin Laird", "Matt Jones", "Matt Kuchar", "Michael Letzig", "Neal Lancaster", "Robert Karlsson", "Skip Kendall", "Stephen Leaney", "Tom Lehman", "Troy Kelly", "Zach Johnson"]
                    })
    puzzles.push({ name: "Golf: PGA Players 7",
                     category: "Sports",
                     words: ["Andrew Magee", "Bill Lunde", "Billy Mayfair", "Daisuke Maruyama", "David Mathis", "Davis Love III", "Frank Lickiter II", "George McNeill", "Hunter Mahan", "Jarrod Lyle", "Jeff Maggert", "Jim McGovern", "John Mallinger", "Len Mattiace", "Parker McLachlin", "Peter Lonard", "Rocco Mediate", "Scott McCarron", "Shigeki Maruyama", "Spencer Levin", "Steve Lowery", "Steve Marino", "Troy Matteson", "Will MacKenzie"]
                    })
    puzzles.push({ name: "Golf: PGA Players 8",
                     category: "Sports",
                     words: ["Arron Oberholser", "Bryan Norton", "Bryce Molder", "Frank Nobilo", "Geoff Ogilvy", "Greg Norman", "Greg Owen", "James Nitties", "James Oh", "Jeff Overton", "Joe Ogilvie", "John Merrick", "Jose Maria Olazabal", "Kevin Na", "Larry Mize", "Leif Olson", "Patrick Moore", "Peter Oosterhuis", "Phil Mickelson", "Rod Pampling", "Ryan Moore", "Ryan Palmer", "Shaun Micheel"]
                    })
    puzzles.push({ name: "Golf: PGA Players 9",
                     category: "Sports",
                     words: ["Aron Price", "Brett Quigley", "Carl Paulson", "Carl Pettersson", "Chez Reavie", "Chris Perry", "Chris Riley", "Corey Pavin", "Craig Parry", "Craig Perks", "Dennis Paulson", "Dicky Pride", "Ian Poulter", "Jeff Quinney", "Jesper Parnevik", "John Rollins", "Kenny Perry", "Pat Perez", "Rick Price", "Scott Piercy", "Tag Ridings", "Ted Purdy", "Tim Petrovic"]
                    })
    puzzles.push({ name: "Greece World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Alexandros Tziolis", "Alexandros Tzorvas", "Angelos Charisteas ", "Avraam Papadopoulos", "Dimitris Salpigidis", "Evangelos Moras", "Giorgos Karagounis", "Giorgos Samaras", "Giorgos Seitaridis", "Greece", "Kostas Chalkias ", "Kostas Katsouranis ", "Loukas Vintra ", "Michalis Sifakis", "Nikos Spiropoulos ", "Otto Rehhagel ", "Pantelis Kapetanos", "Sakis Prittas", "Sotiris Kyrgiakos ", "Sotiris Ninis", "Stelios Malezas", "Theofanis Gekas", "Vasilis Torosidis "]
                    })
    puzzles.push({ name: "Hall Of Fame Football 1",
                     category: "Sports",
                     words: ["Alan Page", "Andy Robustelli", "Art Donovan", "Bill Willis", "Bob Lilly", "Carl Eller", "Dan Hampton", "David Jones", "Doug Atkins", "Elvin Bethea", "Ernie Stautner", "Fred Dean", "Gino Marchetti", "Henry Jordan", "Howie Long", "Jack Youngblood", "Joe Greene", "Junious Buchanan", "Lee Roy Selmon", "Len Ford", "Leo Nomellini", "Merlin Olsen", "Randy White", "Reggie White", "Willie Davis"]
                    })
    puzzles.push({ name: "Hall of Fame Football 2",
                     category: "Sports",
                     words: ["Barry Sanders", "Charley Trippi", "Clarke Hinkle", "Doak Walker", "Eric Dickerson", "Franco Harris", "Frank Gifford", "Gale Sayers", "Hugh McElhenny", "Jim Brown", "Jim Taylor", "Jim Thorpe", "Joe Perry", "John McNally", "John Riggins", "Ken Strong", "Lenny Moore", "Leroy Kelly", "Marcus Allen", "Marion Motley", "Ollie Matson", "Thurman Thomas", "Tony Dorsett", "Walter Payton"]
                    })
    puzzles.push({ name: "Hall of Fame Football 3",
                     category: "Sports",
                     words: ["Bill George", "Bobby Bell", "Darrell Green", "Dave Wilcox", "Dick Butkus", "Dick Lane", "Emlen Tunnell", "Emmitt Thomas", "George Connor", "Harry Carson", "Jack Ham", "Jack Lambert", "Jimmy Johnson", "Joe Schmidt", "Ken Houston", "Larrie Wilson", "Mel Blount", "Mel Renfro", "Mike Haynes", "Paul Krause", "Ronnie Lott", "Sam Huff", "Willie Brown", "Willie Wood", "Yale Lary"]
                    })
    puzzles.push({ name: "Hall of Fame Football 4",
                     category: "Sports",
                     words: ["Art Shell", "Billy Shaw", "Bob Brown", "Bruce Matthews", "Chuck Bednarik", "Dwight Stephenson", "Gary Zimmerman", "Gary Zimmerman", "Gene Hickerson", "Gene Upshaw", "Jim Langer", "Jim Otto", "Jim Parker", "Jim Ringo", "John Hannah", "Larry Little", "Lou Creekmur", "Lou Groza", "Mike McCormack", "Mike Webster", "Rayfield Wright", "Ron Mix", "Ron Yary", "Stan Jones", "Tom Mack"]
                    })
    puzzles.push({ name: "Hall of Fame Quarterbacks",
                     category: "Sports",
                     words: ["Bart Starr", "Bob Griese", "Bob Waterfield", "Bobby Layne", "Dan Fouts", "Dan Marino", "Earl Clark", "Fran Tarkenton", "George Blanda", "Jim Kelly", "Joe Montana", "Joe Namath", "John Driscoll", "John Elway", "Johnny Unitas", "Len Dawson", "Norm Van Brocklin", "Otto Graham", "Roger Staubach", "Sonny Jurgensen", "Steve Young", "Terry Bradshaw", "Troy Aikman", "Warren Moon"]
                    })
    puzzles.push({ name: "Hall of Fame Football 5",
                     category: "Sports",
                     words: ["Art Monk", "Bill Hewitt", "Bobby Mitchell", "Charley Taylor", "Dante Lavelli", "Don Hutson", "Don Maynard", "Elroy Hirsch", "Fred Biletnikoff", "George Halas", "Guy Chamberlin", "James Lofton", "John Stallworth", "Lance Alworth", "Lynn Swann", "Michael Irvin", "Morris Badgro", "Paul Warfield", "Pete Pihos", "Ray Flaherty", "Raymond Berry", "Steve Largent", "Tom Fears", "Tommy McDonald", "Wayne Millner"]
                    })
    puzzles.push({ name: "Heisman Award Winners",
                     category: "Sports",
                     words: ["Alan Ameche", "Archie Griffin", "Barry Sanders", "Billy Sims", "Clint Frank", "Doug Flutie", "Earl Campbell", "Jay Berwanger", "Jim Plunkett", "John Lattner", "Les Horvath", "Marcus Allen", "Mike Garrett", "Nile Kinnick", "Paul Hornung", "Reggie Bush", "Roger Staubach", "Sam Bradford", "Steve Owens", "Terry Baker", "Tim Brown", "Tim Tebow", "Tom Harmon", "Tony Dorsett"]
                    })
    puzzles.push({ name: "Honduras World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Amado Guevara  ", "Carlos Pavon  ", "Danilo Turcios", "David Suazo ", "Donis Escober", "Edgard Alvarez ", "Emilio Izaguirre  ", "Georgie Welcome ", "Hendry Thomas  ", "Honduras", "Johnny Palacios  ", "Julio Cesar de Leon ", "Mauricio Sabillon  ", "Maynor Figueroa  ", "Noel Valladares  ", "Oscar Garcia ", "Osman Chavez", "Ramon Nunez ", "Reinaldo Rueda", "Ricardo Canales  ", "Roger Espinoza ", "Sergio Mendoza ", "Victor Bernardez  ", "Walter Martinez", "Wilson Palacios  "]
                    })
    puzzles.push({ name: "Ice Hockey Players",
                     category: "Sports",
                     words: ["Alex Delvecchio", "Aurele Emilie Joliat", "Bill Cook", "Bill Quackenbush", "Cam Neely", "Chris Drury", "Clark Gillies", "Denis Savard", "Gordon Howe", "Harvey Pulford", "Igor Larionov", "Lester Patrick", "Mark Messier", "Michel Goulet", "Pat LaFontaine", "Patrick Roy", "Peter Stastny", "Phil Esposito", "Ron Francis", "Roy Worters", "Stan Mikita", "Tony Esposito", "Valeri Kharlamov", "Wayne Gretzky"]
                    })
    puzzles.push({ name: "Indoor Sports",
                     category: "Sports",
                     words: ["Aikido", "Billiards", "Bowling", "Boxing", "Curling", "Darts", "Dodgeball", "Fencing", "Gymnastics", "Ice Hockey", "Ice Skating", "Jai-Alai", "Judo", "Jujitsu", "Karate", "Kendo ", "Kung Fu", "Racquetball", "Roller Derby", "Roller Skating", "Table Tennis", "Tae Kwon Do", "Volleyball", "Weight Lifting", "Wrestling"]
                    })
    puzzles.push({ name: "Italy World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Alberto Gilardino  ", "Andrea Pirlo", "Angelo Palombo ", "Antonio Di Natale ", "Christian Maggio  ", "Claudio Marchisio  ", "Daniele De Rossi ", "Domenico Criscito ", "Fabio Cannavaro", "Fabio Cannavaro  ", "Fabio Quagliarella  ", "Federico Marchetti ", "Gennaro Gattuso ", "Giampaolo Pazzini", "Gianluca Zambrotta ", "Gianluigi Buffon  ", "Giorgio Chiellini  ", "Italy", "Leonardo Bonucci ", "Mauro Camoranesi ", "Morgan De Sanctis  ", "Riccardo Montolivo ", "Salvatore Bocchetti  ", "Simone Pepe  ", "Vincenzo Iaquinta  "]
                    })
    puzzles.push({ name: "Ivory Coast World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Abdelkader Keita  ", "Aristides Zogbo", "Arthur Boka ", "Aruna Dindane  ", "Bakary Kone", "Benjamin Brou Angoua  ", "Boubacar Barry", "Cheik Ismael Tiote  ", "Daniel Yeboah", "Didier Drogba  ", "Didier Zokora", "Emmanuel Eboue ", "Emmanuel Kone ", "Gervinho  ", "Guy Demel ", "Ivory Coast", "Kolo Toure", "Salomon Kalou  ", "Siaka Tiene  ", "Souleymane Bamba  ", "Steve Gohouri  ", "Sven-Goran Eriksson", "Yaya Toure  "]
                    })
    puzzles.push({ name: "Japan World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Atsuto Uchida ", "Daiki Iwamasa  ", "Daisuke Matsui ", "Eiji Kawashima  ", "Japan", "Junichi Inamoto  ", "Keiji Tamada ", "Keisuke Honda ", "Kengo Nakamura  ", "Kisho Yano ", "Makoto Hasebe ", "Marcus Tulio Tanaka  ", "Seigo Narazaki ", "Shinji Okazaki  ", "Shunsuke Nakamura ", "Takayuki Morimoto", "Takeshi Okada ", "Yasuhito Endo ", "Yasuyuki Konno  ", "Yoshito Okubo ", "Yuichi Komano ", "Yuji Nakazawa  ", "Yuki Abe ", "Yuto Nagatomo "]
                    })
    puzzles.push({ name: "MLB Batting Champions:American League",
                     category: "Sports",
                     words: ["Alex Johnson", "Alex Rodriguez", "Bernie Williams", "Bill Mueller", "Carl Yastrzemski", "Carney Lansford", "Don Mattingly", "Edgar Martinez", "Frank Thomas", "Fred Lynn", "George Brett", "Ichiro Suzuki", "Joe Mauer", "John Olerud", "Julio Franco", "Kirby Puckett", "Manny Ramirez", "Michael Young", "Nomar Garciaparra", "Pete Runnels", "Rod Carew", "Ted Williams", "Tony Olivia", "Wade Boggs"]
                    })
    puzzles.push({ name: "MLB Batting Champions:National League",
                     category: "Sports",
                     words: ["Albert Pujols", "Barry Bonds", "Bill Buckner", "Bill Madlock", "Billy Williams", "Carl Furillo", "Chipper Jones", "Dave Parker", "Derrek Lee", "Dick Groat", "Freddy Sanchez", "Hank Aaron", "Hanley Ramirez", "Joe Torre", "Keith Hernandez", "Larry Walker", "Matt Holiday", "Pete Rose", "Ralph Garr", "Richie Ashburn", "Rico Carty", "Roberto Clemente", "Tony Gwynn", "Willie Mays"]
                    })
    puzzles.push({ name: "Male Figure Skaters",
                     category: "Sports",
                     words: ["Adrian Alvarado", "Alexei Yagudin", "Brian Boitano", "Brian Joubert", "Christopher Bowman", "Humberto Contreras", "Ilia Kulik", "Ivan Dinev", "Jason Bowman", "Jeremy Abbott", "Jeremy Buttle", "John Curry", "Johnny Weir", "Kurt Browning", "Patrick Chan", "Robin Cousins", "Ryan Bradley", "Samuel Contesti", "Scott Davis", "Scott Hamilton", "Sergei Dobrin", "Shawn Sawyer", "Steven Cousins", "Todd Eldredge", "Tristan Cousins"]
                    })
    puzzles.push({ name: "Male Tennis Stars",
                     category: "Sports",
                     words: ["Andre Agassi", "Andy Roddick", "Arnaud Clement", "Arthur Ashe", "Bill Tilden", "Bjorn Borg", "Boris Becker", "Carlos Moya", "Dmitry Tursunov", "Don Budge", "Ivan Lendl", "James Blake", "Jimmy Connors", "John McEnroe", "Juan Carlos Ferrero", "Marat Safin", "Mats Wilander", "Nicholas Lapentti", "Novak Djokovic", "Pat Cash", "Pete Sampras", "Rafael Nadal", "Rod Laver", "Roger Federer", "Tommy Haas"]
                    })
    puzzles.push({ name: "Mexico World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Adolfo Bautista ", "Alberto Medina  ", "Andres Guardado ", "Carlos Salcido ", "Carlos Vela", "Cuauhtemoc Blanco ", "Efrain Juarez", "Francisco Rodriguez  ", "Gerardo Torrado ", "Giovani dos Santos ", "Guillermo Franco ", "Hector Moreno ", "Israel Castro ", "Javier Aguirre", "Javier Hernandez ", "Jonny Magallon  ", "Jorge Torres Nilo ", "Luis Ernesto Michel ", "Memo Ochoa ", "Mexico", "Oscar Perez", "Pablo Barrera ", "Paul Aguilar ", "Rafael Marquez ", "Ricardo Osorio "]
                    })
    puzzles.push({ name: "NBA Basketball Teams",
                     category: "Sports",
                     words: ["Atlanta Hawks", "Boston Celtics", "Chicago Bulls", "Cleveland Cavaliers", "Dallas Mavericks", "Denver Nuggets", "Detroit Pistons", "Houston Rockets", "Indians Pacers", "LA Clippers", "LA Lakers", "Memphis Grizzlies", "New Jersey Nets", "New Orleans Hornets", "New York Knicks", "Phoenix Suns", "Sacramento Kings", "San Antonio Spurs", "Seattle Supersonics", "Toronto Raptors", "Washingon Wizards"]
                    })
    puzzles.push({ name: "NFL Coaches of the Year",
                     category: "Sports",
                     words: ["Andy Reid", "Bill Cowher", "Bill Parcells", "Bill Walsh", "Buck Shaw", "Bud Grant", "Chuck Knox", "Dan Devine", "Dan Reeves", "Dick Nolan", "Dom Capers", "Don Shula", "George Allen", "George Halas", "Jack Pardee", "Jim Mora", "Joe Gibbs", "Lindy Infante", "Lovie Smith", "Mike Ditka", "Ray Rhodes", "Red Miller", "Sean Payton", "Tom Landry", "Vince Lombardi"]
                    })
    puzzles.push({ name: "NHL Hockey Teams",
                     category: "Sports",
                     words: ["Anaheim Ducks", "Atlanta Thrashers", "Boston Bruins", "Buffalo Sabres", "Calgary Flames", "Carolina Hurricanes", "Dallas Stars", "Detroit Red WIngs", "Edmonton Oilers", "Florida Panthers", "Los Angeles Kings", "Minnesota Wild", "Montreal Canadiens", "Nashville Predators", "New York Islanders", "New York Rangers", "Ottawa Senators", "Philadelphia Flyers", "Phoenix Coyotes", "Pittsburgh Penguins", "San Jose Sharks", "Tampa Bay Lightning", "Vancouver Canucks", "Washington Capitals"]
                    })
    puzzles.push({ name: "Netherlands World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Andre Ooijer ", "Arjen Robben", "Bert van Marwijk ", "Demy de Zeeuw ", "Dirk Kuyt ", "Edson Braafheid ", "Eljero Elia ", "Gregory van der Wiel ", "Ibrahim Afellay ", "John Heitinga ", "Joris Mathijsen", "Khalid Boulahrouz ", "Klaas-Jan Huntelaar ", "Mark van Bommel ", "Michel Vorm ", "Netherlands", "Nigel de Jong ", "Rafael van der Vaart  ", "Robin van Persie ", "Ryan Babel ", "Sander Boschker ", "Stijn Schaars", "Wesley Sneijder "]
                    })
    puzzles.push({ name: "New Zealand World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Aaron Clapham  ", "Andy Barron ", "Andy Boyens ", "Ben Sigmund ", "Chris Killen", "Chris Wood", "David Mulligan ", "Glen Moss ", "Ivan Vicelich", "James Bannatyne  ", "Jeremy Brockie  ", "Jeremy Christie  ", "Leo Bertos ", "Mark Paston ", "Michael McGlinchey", "New Zealand", "Ricki Herbert ", "Rory Fallon  ", "Ryan Nelsen ", "Shane Smeltz  ", "Simon Elliott  ", "Tim Brown  ", "Tommy Smith  ", "Tony Lochhead ", "Winston Reid "]
                    })
    puzzles.push({ name: "Nigeria World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Austin Ejide", "Ayodele Adeleye ", "Brown Ideye", "Chidi Odiah ", "Chinedu Ogbuke Obasi  ", "Daniel Shittu ", "Dele Aiyenugba  ", "Dickson Etuhu ", "Elderson Echiejile ", "Haruna Lukman  ", "John Utaka  ", "Joseph Yobo ", "Kalu Uche ", "Lars Lagerback", "Nigeria", "Nwankwo Kanu ", "Obafemi Martins ", "Osaze Odemwingie", "Rabiu Afolabi", "Sani Kaita ", "Taye Taiwo ", "Victor Obinna Nsofor ", "Vincent Enyeama ", "Yakubu Aiyegbeni ", "Yusuf Ayila  "]
                    })
    puzzles.push({ name: "North Korea World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["An Chol Hyok ", "An Yong Hak ", "Cha Jong Hyok ", "Choe Kum Chol ", "Hong Yong Jo ", "Ji Yun Nam ", "Jong Tae Se ", "Kim Jong-Hun ", "Kim Kum Il ", "Kim Kyong Il ", "Kim Myong-won", "Kim Yong Jun ", "Mun In Guk ", "Nam Song Chol ", "North Korea", "Pak Chol Jin ", "Pak Nam Chol", "Pak Nam Chol ", "Pak Sung Hyok ", "Ri Chol Myong ", "Ri Jun Il ", "Ri Kwang Chon ", "Ri Kwang Hyok", "Ri Myong-guk "]
                    })
    puzzles.push({ name: "Paraguay World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Aldo Bobadilla", "Antolin Alcaraz ", "Aureliano Torres", "Carlos Bonet ", "Cristian Riveros ", "Dario Veron ", "Denis Caniza ", "Diego Barreto ", "Edgar Barreto ", "Edgar Benitez  ", "Enrique Vera ", "Gerardo Martino ", "Jonathan Santana ", "Julio Caceres  ", "Justo Villar ", "Lucas Barrios ", "Nelson Haedo Valdez ", "Nestor Ortigoza ", "Oscar Cardozo  ", "Paraguay", "Paulo Da Silva  ", "Rodolfo Gamarra", "Roque Santa Cruz  ", "Victor Caceres "]
                    })
    puzzles.push({ name: "Portugal World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Beto ", "Bruno Alves ", "Carlos Queiroz", "Cristiano Ronaldo ", "Daniel Fernandes ", "Danny", "Deco ", "Duda ", "Eduardo ", "Fabio Coentrao ", "Hugo Almeida ", "Liedson ", "Miguel ", "Miguel Veloso ", "Paulo Ferreira ", "Pedro Mendes ", "Pepe  ", "Portugal", "Raul Meireles ", "Ricardo Carvalho ", "Ricardo Costa ", "Rolando ", "Ruben Amorim", "Simao Sabrosa ", "Tiago "]
                    })
    puzzles.push({ name: "Rodeo",
                     category: "Sports",
                     words: ["bail out", "ball out", "brand", "branding iron", "broke", "bronco", "chute", "crow hop", "high roller", "hobbling", "honest bucker", "hooligan", "jingle bobs", "mugging", "no time", "out the backdoor", "pick up man", "punch", "remuda", "reride", "rim-fire", "rowel", "stock contractor", "sun fish", "swap ends"]
                    })
    puzzles.push({ name: "Serbia World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Aleksandar Kolarov", "Aleksandar Lukovic", "Andjelko Djuricic ", "Antonio Rukavina ", "Bojan Isailovic", "Branislav Ivanovic", "Danko Lazovic", "Dejan Stankovic", "Dragan Mrdja", "Gojko Kacar", "Ivan Obradovic", "Marko Pantelic", "Milan Jovanovic", "Milos Krasic", "Milos Ninkovic", "Nemanja Vidic ", "Nenad Milijas", "Neven Subotic ", "Nikola Zigic", "Radmoir Antic ", "Radosav Petrovic ", "Serbia", "Vladimir Stojkovic", "Zdravko Kuzmanovic", "Zoran Tosic  "]
                    })
    puzzles.push({ name: "Slovakia World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Dusan Kuciak ", "Dusan Pernis ", "Erik Jendrisek ", "Filip Holosko  ", "Jan Durica ", "Jan Kozak ", "Jan Mucha ", "Juraj Kucka  ", "Kamil Kopunek ", "Kornel Salate ", "Marek Cech ", "Marek Hamsik ", "Marek Sapara  ", "Martin Jakubko ", "Martin Petras ", "Martin Skrtel  ", "Miroslav Stoch  ", "Peter Pekarik  ", "Radoslav Zabavnik  ", "Robert Vittek ", "Slovakia", "Stanislav Sestak", "Vladimir Weiss ", "Vladimir Weiss  ", "Zdeno Strba "]
                    })
    puzzles.push({ name: "Slovenia World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Aleksander Seliga ", "Andraz Kirm", "Andrej Komac", "Bojan Jokic ", "Bostjan Cesar", "Branko Ilic ", "Dalibor Stevanovic", "Elvedin Dzinic", "Jasmin Handanovic", "Marko Suler", "Matej Mavric-Rozic", "Matjaz Kek ", "Milivoje Novakovic ", "Miso Brecko", "Nejc Pecnik ", "Rene Krhin", "Robert Koren", "Samir Handanovic", "Slovenia", "Suad Filekovic", "Tim Matavz", "Valter Birsa ", "Zlatan Ljubijankic ", "Zlatko Dedic"]
                    })
    puzzles.push({ name: "Soccer",
                     category: "Sports",
                     words: ["challenge", "corner flag", "corner kick", "forwards", "foul", "free kick", "fullbacks", "goal box", "goalkeeper", "header", "linesman", "mid-fielders", "offsides", "pass", "penalty", "penalty box", "penalty kick", "pitch", "red card", "stopper", "strikers", "sweeper", "trap", "wall", "yellow card"]
                    })
    puzzles.push({ name: "South Africa World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Aaron Mokoena ", "Anele Ngcongca ", "Bernard Parker", "Bongani Khumalo ", "Itumeleng Khune ", "Kagisho Dikgacoi  ", "Katlego Mphela  ", "Lance Davids  ", "Lucas Thwala", "Macbeth Sibaya", "Matthew Booth ", "Moeneeb Josephs ", "Shu-Aib Walters ", "Siboniso Gaxa ", "Siphiwe Tshabalala  ", "Siyabonga Nomvete ", "Siyabonga Sangweni  ", "South Africa", "Steven Pienaar  ", "Surprise Moriri ", "Teko Modise  ", "Thanduyise Khuboni ", "Tsepo Masilela  "]
                    })
    puzzles.push({ name: "South Korea World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Ahn Jung-hwan  ", "Cha Du-ri ", "Cho Yong-hyung  ", "Huh Jung-Moo", "Jung Sung-ryong  ", "Kang Min-soo ", "Ki Sung-yong ", "Kim Bo-kyung ", "Kim Dong-jin ", "Kim Hyung-il ", "Kim Jae-sung ", "Kim Jung-woo ", "Kim Nam-il ", "Kim Young-kwang ", "Lee Chung-yong  ", "Lee Dong-gook", "Lee Jung-soo ", "Lee Seung-ryul ", "Lee Woon-jae ", "Lee Young-pyo  ", "Oh Beom-seok ", "Park Chu-young  ", "Park Ji-sung", "South Korea"]
                    })
    puzzles.push({ name: "Spain World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Alvaro Arbeloa  ", "Andres Iniesta ", "Carles Puyol ", "Carlos Marchena  ", "Cesc Fabregas ", "David Silva  ", "David Villa", "Fernando Llorente  ", "Fernando Torres  ", "Gerard Pique  ", "Iker Casillas  ", "Javier Martinez  ", "Jesus Navas ", "Joan Capdevila ", "Juan Manuel Mata  ", "Pedro Rodriguez ", "Raul Albiol ", "Sergio Busquets ", "Sergio Ramos", "Spain", "Vicente Del Bosque", "Victor Valdes", "Xabi Alonso ", "Xavi Hernandez"]
                    })
    puzzles.push({ name: "Summer Olympic Events",
                     category: "Sports",
                     words: ["Badminton", "Baseball", "Basketball", "Boxing", "Cycling", "Diving", "Gymnastics", "Judo", "Kayaking", "Marathon", "Mountain Biking", "Rowing", "Sailing", "Sailing", "Soccer", "Swimming", "Taekwondo", "Tennis", "Track and Field", "Triathlon", "Volleyball", "Water Polo", "Weightlifting", "Wrestling"]
                    })
    puzzles.push({ name: "Superbowl MVPs",
                     category: "Sports",
                     words: ["Bart Starr", "Chuck Howley", "Emmitt Smith", "Franco Harris", "Fred Biletnikoff", "Harvey Martin", "Jake Scott", "Jerry Rice", "Jim Plunkett", "Joe Montana", "Joe Namath", "John Elway", "Kurt Warner", "Larry Brown", "Larry Csonka", "Len Dawson", "Lynn Swann", "Peyton Manning", "Randy White", "Ray Lewis", "Roger Staubach", "Steve Young", "Terry Bradshaw", "Tom Brady", "Troy Aikman"]
                    })
    puzzles.push({ name: "Superbowl Teams",
                     category: "Sports",
                     words: ["Atlanta Falcons", "Baltimore Colts", "Baltimore Ravens", "Buffalo Bills", "Carolina Panthers", "Chicago Bears", "Dallas Cowboys", "Denver Broncos", "Green Bay Packers", "Indianapolis Colts", "Kansas City Chiefs", "Miami Dolphins", "New England Patriots", "New York Giants", "New York Jets", "Oakland Raiders", "Philadelphia Eagles", "Pittsburgh Steelers", "San Diego Chargers", "Seattle Seahawks", "Tampa Bay Buccaneers", "Tennessee Titans", "Wahsington Redskins"]
                    })
    puzzles.push({ name: "Switzerland World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Albert Bunjaku", "Alexander Frei", "Benjamin Huggel", "Blaise Nkufo", "Diego Benaglio", "Eren Derdiyok", "Gelson Fernandes ", "Gokhan Inler", "Hakan Yakin", "Johnny Leoni ", "Ludovic Magnin", "Marco Padalino", "Marco Woelfli", "Mario Eggimann", "Ottmar Hitzfeld ", "Philippe Senderos", "Pirmin Schwegler", "Reto Ziegler", "Stephane Grichting ", "Steve Von Bergen", "Switzerland", "Tranquillo Barnetta", "Valon Behrami", "Xherdan Shaqiri"]
                    })
    puzzles.push({ name: "Team Sports",
                     category: "Sports",
                     words: ["baseball", "basketball", "beach volleyball", "bobsledding", "broomball", "cricket", "curling", "field hockey", "field lacrosse", "floor hockey", "floorball", "football", "hurling", "lacrosse", "netball", "rugby", "scout ball", "shinty", "shuttlecock", "soccer", "softball", "throwball", "water polo"]
                    })
    puzzles.push({ name: "Track And Field",
                     category: "Sports",
                     words: ["decathlon", "discus", "hammer", "high jump", "javelin", "long jump", "pole vault", "shot put", "triple jump"]
                    })
    puzzles.push({ name: "U.S. Marathons",
                     category: "Sports",
                     words: ["Buzz", "Catalina", "Equinox", "Grand Canyon", "Little Rock", "Long Beach", "Lost Dutchman", "Mercedes", "Mid South", "Rocket City", "Sedona", "The Napa Valley", "Tucson", "Valley of the Sun", "Yukon River Trail"]
                    })
    puzzles.push({ name: "U.S. Marathons 10",
                     category: "Sports",
                     words: ["Bay Bridge", "Capitol City", "Casper", "Charlottesville", "Durango", "Fox Cities", "Green Bay", "Healthy Huntington", "Journeys", "Lake Front", "Mad City", "Marine Corps", "Omaha", "Paavo Nurmi", "Palos Verdes", "San Juan Island", "Seattle", "Tucson", "Tybee", "Virginia Creeper", "Whidbey Island", "Whistle Stop", "Wyoming", "Yakima River Run"]
                    })
    puzzles.push({ name: "U.S. Marathons 2",
                     category: "Sports",
                     words: ["Avenue of the Giants", "Black Horse", "Boulder Back Roads", "Colorado", "Colorado Colfax", "Death Valley", "Denver", "Diablo", "Durango", "Estes Park", "Golden Gate", "Greater Hartford", "Inland Empire", "Lake Tahoe", "Los Angeles", "Mystic Country", "Nipmuck Trail", "Palos Verdes", "Redding", "Santa Clarita", "Steamboat", "The San Francisco"]
                    })
    puzzles.push({ name: "U.S. Marathons 3",
                     category: "Sports",
                     words: ["Atlanta", "Callaway Gardens", "City of Trees", "Delaware", "Florida Gulf Beaches", "Honolulu", "Ing Miami", "Jacksonville", "Kona", "Maui", "Museum of Aviation", "Ocala", "Pocatello", "Sarasota", "Space Coast", "Tallahassee", "Tybee", "Walt Disney World", "X-Country"]
                    })
    puzzles.push({ name: "U.S. Marathons 4",
                     category: "Sports",
                     words: ["Baton Rouge", "Eisenhower", "Famous Idaho Potato", "IMT Des Moines", "Indianapolis", "LaSalle Bank Chicago", "Lake Shore", "Louisiana Trails", "Louisville", "Maine", "Marathon to Marathon", "Mardi Gras", "Mesa Falls", "Mount Desert Island", "Olathe", "Paul Bunyon", "Quad Cities", "Sunburst Races", "Teton DAM", "The Baltimore", "Wichita"]
                    })
    puzzles.push({ name: "U.S. Marathons 5",
                     category: "Sports",
                     words: ["Bayshore", "Baystate", "Boston", "Cape Cod", "Detroit Free Press", "Frederick", "Grand Rapids", "Hyannis", "Lake Geneva", "Marathon in the Parks", "Martian", "Med-City", "Mississippi Coast", "Ocean City", "Rock Creek Park", "Taunton", "The Trail", "Twin Cities", "Walker North Country", "West Michigan"]
                    })
    puzzles.push({ name: "U.S. Marathons 6",
                     category: "Sports",
                     words: ["Atlantic City", "Clarence DeMar", "Duke City", "Grizzly", "Heart of America", "Kansas City", "Marathon de Taos", "Montana", "New Hampshire", "New Jersey", "New Mexico", "New York City", "Ocean Drive", "Omaha", "Rio Grande", "Run for the Border", "Silver State", "The Berryman", "Tri-State", "Two Bear"]
                    })
    puzzles.push({ name: "U.S. Marathons 7",
                     category: "Sports",
                     words: ["Adirondack", "Air Force", "Akron", "Athens", "Bismarck", "Black Mountain", "Buffalo", "Cleveland", "Columbus", "Ellerbe Springs", "Fargo", "Flying Pig", "Glass City", "Lake Placid", "Mohawk Hudson River", "OBX Marathon", "Ontario Shore", "Rochester", "Thunder Road", "Trestle Valley", "Umstead Trail", "West Chester", "Wineglass"]
                    })
    puzzles.push({ name: "U.S. Marathons 8",
                     category: "Sports",
                     words: ["Crater Lake Rim Run", "Erie", "Eugene", "Harrisburg", "Haulin Aspen Trail", "Johnstown", "Kiawah Island", "Leading Ladies", "Myrtle Beach", "Newport", "Ocean State", "Ohio River RRC", "Oklahoma", "Pacific Crest", "Philadelphia", "Pittsburgh", "Pocono", "Portland", "Steamtown", "Towpath"]
                    })
    puzzles.push({ name: "U.S. Marathons 9",
                     category: "Sports",
                     words: ["Austin", "Big D Texas", "Brookings", "Country Music", "Cowtown", "Grasslands Run", "Green Mountain", "Houston", "Knoxville", "Moab", "Ogden", "Park City", "Richmond", "Salt Lake City", "San Antonio", "Seabrook Lucky Trail", "Shamrock", "Stowe", "The Jay Mountain", "Top of Utah", "Vermont City", "White Rock"]
                    })
    puzzles.push({ name: "U.S. Speed Skaters",
                     category: "Sports",
                     words: ["Allison Baver", "Anthony Lobello", "Apolo Anton Ohno", "Brent Aussbrung", "Brian Hansen", "Chad Hedrick", "Chris Needham", "Eddy Alvarez", "Elli Ochowicz", "Heather Richardson", "Jeff Simon", "Jennifer Rodriguez", "Jessica Smith", "Jordan Malone", "Katherine Reutter", "Kimberly Derrick", "Lauren Cholewinski", "Maria Lamb", "Mia Manganello", "Mike Blumel", "Nick Pearson", "Ryan Bedford", "Travis Jayner", "Trevor Marsicano"]
                    })
    puzzles.push({ name: "USA World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Benny Feilhaber", "Bob Bradley", "Brad Guzan", "Carlos Bocanegra", "Clarence Goodson", "Clint Dempsey", "DaMarcus Beasley", "Edson Buddle", "Herculez Gomez", "Jay DeMerit", "Jonathan Bornstein", "Jonathan Spector", "Jose Torres", "Jozy Altidore", "Landon Donovan", "Marcus Hahnemann", "Maurice Edu", "Michael Bradley", "Oguchi Onyewu", "Ricardo Clark", "Robbie Findley", "Steve Cherundolo", "Stuart Holden", "Tim Howard", "United States"]
                    })
    puzzles.push({ name: "Uruguay World Cup Roster 2010 ",
                     category: "Sports",
                     words: ["Alvaro Fernandez ", "Alvaro Pereira ", "Andres Scotti ", "Diego Forlan  ", "Diego Godin ", "Diego Lugano ", "Diego Perez ", "Edinson Cavani ", "Egidio Arevalo ", "Fernando Muslera ", "Ignacio Gonzalez ", "Jorge Fucile ", "Juan Castillo ", "Luis Suarez ", "Martin Caceres ", "Martin Silva ", "Mauricio Victorino ", "Maximiliano Pereira ", "Nicolas Lodeiro ", "Oscar Tabarez ", "Sebastian Abreu ", "Sebastian Eguren ", "Sebastian Fernandez", "Uruguay", "Walter Gargano "]
                    })
    puzzles.push({ name: "Volleyball",
                     category: "Sports",
                     words: ["ace", "block", "change of court", "court", "dead ball", "defense miss", "dig", "foot fault", "kill", "offensive miss", "out of bounds", "palming", "player rotation", "playing the ball", "rally", "roof", "serve", "server", "service", "service order", "service reception", "sideout", "stuff", "term of service", "volley"]
                    })
    puzzles.push({ name: "Wimbledon Champions: Men",
                     category: "Sports",
                     words: ["Anthony Wilding", "Arthur Gore", "Bill Johnston", "Bill Tilden", "Ellsworth Vines", "Ernest Renshaw", "Frank Hadlow", "Fred Perry", "Gerald Patterson", "Harold Mahoney", "Henri Cochet", "Herbert Lawford", "Jack Crawford", "Jean Borotra", "John Hartley", "Joshua Pim", "Lawrence Doherty", "Norman Brookes", "Reginald Doherty", "Rene Lacoste", "Sid Wood", "Spencer Gore", "Wilfred Baddeley", "William Renshaw", "Willoughby Hamilton"]
                    })
    puzzles.push({ name: "Wimbledon Champions: Men 2",
                     category: "Sports",
                     words: ["Alex Olmedo", "Andre Agassi", "Ashley Cooper", "Bob Falkenburg", "Bobby Riggs", "Chuck McKinley", "Don Budge", "Frank Sedgman", "Jack Kramer", "Jan Kodes", "Jaroslav Drobny", "John McEnroe", "Lew Hoad", "Lleyton Hewitt", "Manuel Santana", "Neale Fraser", "Pete Sampras", "Rod Laver", "Roger Federer", "Roy Emerson", "Stan Smith", "Ted Schroeder", "Tony Trabert", "Vic Seixas", "Yvon Petra"]
                    })
    puzzles.push({ name: "Wimbledon Champions: Women",
                     category: "Sports",
                     words: ["Alice Marble", "Billie Jean King", "Blanche Bingley", "Charlotte Cooper", "Chris Evert", "Doris Hart", "Dorothea Douglass", "Dorothy Round", "Helen Rice", "Helen Wills", "Kitty McKane Godfree", "Margaret Osborne", "Margaret Smith", "Maria Bueno", "Martina Hingis", "Martina Navratilova", "Maud Watson", "Maureen Connolly", "May Sutton", "Muriel Robb", "Pauline Betz", "Serena Williams", "Shirley Fry", "Steffi Graf", "Venus Williams"]
                    })
    puzzles.push({ name: "Winter Olympic Events",
                     category: "Sports",
                     words: ["Alpine Skiing", "Biathlon", "Bobsled", "Bobsleigh", "Combined Downhill", "Cross-Country Skiing", "Curling", "Downhill", "Figure Skating", "Figure Skating", "Freestyle Aerials", "Freestyle Moguls", "Giant Slalom", "Ice Dancing", "Ice Hockey", "Luge", "Nordic Combined", "Short Track", "Skeleton", "Ski Jumping", "Slalom", "Snowboarding", "Speed Skating", "Super-G", "Team Luge"]
                    })
    puzzles.push({ name: "Women Basketball Players",
                     category: "Sports",
                     words: ["Babe Didrikson", "Becky Hammon", "Candace Parker", "Chantelle Anderson", "Coco Miller", "Cynthia Cooper", "Dawn Staley", "Diana Taurasi", "Kara Wolters", "Kelly Miller", "Kim Perrot", "Lauren Jackson", "Lindsay Whalen", "Lisa Leslie", "Nera White", "Nicole Powell", "Rebecca Lobo", "Semeka Randall", "Shannon Johnson", "Sheryl Swoopes", "Sue Bird", "Swin Cash", "Tamika Catchings", "Tari Phillips", "Tina Thompson"]
                    })
    puzzles.push({ name: "World Marathons",
                     category: "Sports",
                     words: ["Great Wall", "Hokkaido", "Knysna Forest", "Marathon Bhutan", "Mumbai", "Okinawa", "Saberkas RH", "Singapore", "Tateyama Wakashio", "The Big Five", "The Great Tibetan", "Tiberias", "Tindouf-Sahara", "Tokyo", "Tsukuba"]
                    })
    puzzles.push({ name: "World Marathons 2",
                     category: "Sports",
                     words: ["Aabenraa Mountain", "Beernem-Baccara", "Bornholm", "Brugge-Guldensporen", "Copenhagen", "FarsA d-Denmark", "Graz", "In Flanders Fields", "Klagenfurt", "Linz", "Maas", "Medvinds", "North Sea Beach", "Nuuk", "Plitvice", "Tirol Vital", "Vienna City", "Wachau", "Wienerwald"]
                    })
    puzzles.push({ name: "World Marathons 3",
                     category: "Sports",
                     words: ["Aarhus City", "Aland", "Albi", "Annecy", "Baltic", "Combs-la-ville", "Figeac", "Forssa-Summer Night", "Helsinki City", "Le Touquet", "Lyon", "Marathon de Nantes", "Marathon des Coteaux", "Marathon du Cognac", "Paavo Nurmi", "Stjerne", "Terwa"]
                    })
    puzzles.push({ name: "World Marathons 4",
                     category: "Sports",
                     words: ["Aristotelian", "Athens", "Budapest", "Edinburgh", "Halstead", "Hampshire-New Forest", "Loch Ness", "London", "Myvatn", "Paris", "Reims a toutes jambes", "Reykjavik", "Robin Hood", "Sheffield"]
                    })
    puzzles.push({ name: "World Marathons 5",
                     category: "Sports",
                     words: ["Bari", "Bolzano", "Corteno Golgi", "Dublin", "Echternach", "Firenze", "Genoa-Sea", "Latina", "Liechenstein", "Maratona Ravenna", "Milan", "Napels-Napoli", "Nightmarathon", "Palermo", "Piceno", "Sky", "Treviso", "Turin", "Venice", "Vigarano Maratona"]
                    })
    puzzles.push({ name: "World Marathons 6",
                     category: "Sports",
                     words: ["Almere", "Amsterdam", "Anjum-Lauwersland", "Apeldoorn Midwinter", "Beneden Leeuwen", "Eindhoven", "Enschede Twente", "Etten-Leur-Brabant", "Hornindalsvatnet", "Leiden", "Lodz", "Maas", "Maratona de Lisboa", "Meerssen-Mergelland", "Midnight Sun", "Poznan", "Rotterdam", "Sirdal-Surleskard", "Soest-Bos", "Spitsbergen", "Terschelling-Beren", "Warsaw", "Wroclaw"]
                    })
    puzzles.push({ name: "World Marathons 7",
                     category: "Sports",
                     words: ["Barcelona", "Biel", "Blekinge", "Davos", "Genenva", "Jungfrau", "Kosice Peace", "Lanzarote", "Lausanne", "Madrid", "Ostersund", "Radenci-Three Hearts", "San Marino", "San Sebastiajn", "Sevilla", "Stockholm", "Ticino", "Tui", "Val-d-Travers", "Valencia", "Vic", "Vindelalven"]
                    })
    puzzles.push({ name: "World Marathons 8",
                     category: "Sports",
                     words: ["Bad Salzuflen", "Berlin", "Bodensee", "Drebber", "Dresden", "Edersee", "Elypso", "Essen", "Fulda", "Fun Run", "Hamburg", "Hamburg Region", "Hannover", "Husum Winter", "Kiel", "Leipzig", "Lengenfeld", "Marburg", "Rursee", "Silvester", "Springe-Deister", "Unnaer Stadt", "Wegberg", "Wernigerode"]
                    })
    puzzles.push({ name: "Airlines",
                     category: "Transportation",
                     words: ["Aeromexico", "Air Canada", "Air China", "Air Jamaica", "Alaska ", "Aloha", "American", "American West", "British Airways", "Continental", "Delta", "Egypt Air", "Jet Blue", "Korean Air", "Mexicana", "Midway", "National", "Northwest", "Pan American", "Philippine", "Southwest", "Swiss", "US Airways", "United", "Virgin Atlantic"]
                    })
    puzzles.push({ name: "American Vehicles",
                     category: "Transportation",
                     words: ["Buick", "Cadillac", "Chevrolet", "Chevy", "Chrysler", "Corvette", "Dodge", "Enclave", "Ford", "GMC", "General Motors", "Grand Cherokee", "Grand Prix", "Hummer", "Jeep", "Land Rover", "Lincoln", "Mercury", "Mustang", "Navigator", "Oldsmobile", "Pontiac", "Ranger", "Saturn", "Sebring"]
                    })
    puzzles.push({ name: "Nautical Terms",
                     category: "Transportation",
                     words: ["aboard", "adrift", "aloft", "bearing", "below", "buoy", "capsize", "course", "dead ahead", "ebb", "fore-and-aft", "gangway", "headway", "knot", "lee", "mooring", "navigation", "outboard", "planing", "port", "rode", "starboard", "trim", "underway", "yaw"]
                    })
    puzzles.push({ name: "Parts Of A Car",
                     category: "Transportation",
                     words: ["air filter", "alternator", "antenna", "brake", "bumper", "clutch", "distributor cap", "distributor rotor", "fan blade", "fan clutch", "fender", "fuel injector", "grill", "hood", "hubcap", "ignition", "oil filter", "radiator", "radiator hose", "shocks", "starter", "timing belt", "transmission", "trunk", "turn signal"]
                    })
    puzzles.push({ name: "Parts Of A Plane",
                     category: "Transportation",
                     words: ["aileron", "cockpit", "door", "dorsal", "elevator", "engine", "engine cowl", "fin", "flaps", "fuselage", "landing gear", "landing light", "propeller", "rudder", "seat", "slats", "spinner", "spoiler", "vertical stabilizer", "wheel cover", "windshield", "wing", "wing strut", "wing tip light"]
                    })
    puzzles.push({ name: "Parts Of A Ship",
                     category: "Transportation",
                     words: ["bow", "bulkhead", "cabin", "chine", "cuddy", "deck", "forepeak", "galley", "hatch", "helm", "hull", "keel", "mast", "propeller", "rig", "rudder", "sail", "screw", "sole", "stem", "stern", "tiller", "topsides", "transom", "waterline"]
                    })
    puzzles.push({ name: "Railroad Terminology",
                     category: "Transportation",
                     words: ["Red Eye", "angle cock", "armed", "auxiliary reservoir", "bail", "ball", "boxcar", "branch line", "caboose", "conductor", "derail", "drill track", "engine", "guage", "hostler", "knuckle", "line haul road", "locomotive", "marker", "pantograph", "pony truck", "rerailer", "ruling grade", "tender", "track car"]
                    })
    puzzles.push({ name: "Types Of Autos",
                     category: "Transportation",
                     words: ["SUV", "cargo van", "compact", "convertible", "coupe", "crew cab truck", "extended cab truck", "flat bed truck", "full hybrid", "hatchback", "jeep", "limousine", "mild hybrid", "minivan", "passenger", "race", "sedan", "semi truck", "sports", "station wagon", "truck", "van", "van"]
                    })
    puzzles.push({ name: "Types Of Boats",
                     category: "Transportation",
                     words: ["barge", "canoe", "catamaran", "cruiser", "cutter", "dinghy", "dory", "ferry", "gondola", "houseboat", "inflatable boat", "kayak", "lifeboat", "motorboat", "pinnace", "powerboat", "raft", "rowboat", "sailboat", "schooner", "skiff", "submarine", "tugboat", "u-boat", "yacht"]
                    })
  commit_puzzles(puzzles)
  end
end