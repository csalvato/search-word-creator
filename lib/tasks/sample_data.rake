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
  end

  def commit_puzzles(puzzles)
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
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
    category = "Tools"
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
end