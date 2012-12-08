namespace :db do
  desc "Fill database with categorized puzzles"
  task populate: :environment do
    make_puzzles_for_holidays_category
    make_puzzles_for_agriculture_category
    make_puzzles_for_american_history_category
    make_puzzles_for_architecture
    make_puzzles_for_art
    make_puzzles_for_art_and_music
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
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      new_puzzle.words = puzzle[:words]
      #puts new_puzzle.inspect #debugging
      new_puzzle.save!
    end
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
    puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      new_puzzle.words = puzzle[:words]
      #puts new_puzzle.inspect #debugging
      new_puzzle.save!
    end
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
                   words: ["Before I Gaze At You", "C'est Moi", "Camelot", "Fie On Goodness!", "Follow Me", "Guenevere", "Guenevere", "How To Handle A Woman", "King Arthur", "Lady Catherine", "Merlyn", "Mordred", "Morgan Le Fey", "Nimue", "Parade", "Pellinore", "Sir Lancelot", "The Lusty Month of May"] 
                  })
    puzzles.push({ name: "Chicago",
                   category: category,
                   words: "All I Care About", "All That Jazz", "Amos Hart", "Bandleader", "Billy Flynn", "Cell Block Tango", "Class", "Fred Casely", "Funny Honey", "I Know A Girl", "Little Bit of Good", "Mary Sunshine", "Matron Mama Morton", "Me and My Baby", "My Own Best Friend", "Nowadays", "Razzle Dazzle", "Roxie", "Roxie Hart", "Sergeant Fogarty", "Velma Kelly"] 
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
                   words: ["Bill Austin", "Chiquitita", "Dancing Queen", "Does Your Mother Know", "Donna Sheridan", "Gimme! Gimme!", "Harry Bright", "Lay All Your Love on Me", "Mamma Mia", "Our Last Summer", "Rosie", "Sam Carmichael", "Sophie Sheridan", "Super Trouper", "Take a Chance on Me", "Tanya", "The Name of the Game", "Under Attack", "Voulez-Vous"] 
                  })
    puzzles.push({ name: "Rent Songs",
                   category: category,
                   words: ["Another Day", "Christmas Bells", "Contact", "Goodbye Love", "I Should Tell You", "Life Support", "Light My Candle", "On the Street", "One Song Glory", "Out Tonight", "Over the Moon", "Rent", "Santa Fe", "Seasons of Love", "Take Me or Leave Me", "Tango Maureen", "What You Own", "Without You", "Your Eyes"] 
                  })
    puzzles.push({ name: "The Lion King",
                   category: category,
                   words: ["Be Prepared", "Chow Down", "Circle Of Life", "Endless Night", "Hakuna Matata", "He Lives in You", "King Of Pride Rock", "Mufasa", "Nala", "One By One", "Pumbaa", "Rafiki", "Sarabi", "Scar", "Shadowland", "Shenzi", "Simba", "The Morning Report", "They Live in You", "Timon", "Zazu"] 
                  })
    puzzles.push({ name: "The Phantom of the Opera",
                   category: category,
                   words: ["All I Ask of You", "Angel Of Music", "Carlotta Giudicelli", "Christine Daae", "Firmin", "Joseph Buquet", "Madame Giry", "Magical Lasso", "Masquerade", "Meg Griy", "Notes/Prima Donna", "Raoul", "The Music of the Night", "The Point of No Return", "Think of Me", "Ubaldo Piangi"]
                  })
    puzzles.push({ name: "80s Hitmakers",
                   category: category,
                   words: ["Belinda Carlisle", "Billy Idol", "Bon Jovi", "Culture Club", "Cyndi Lauper", "Debbie Gibson", "Duran Duran", "Heart", "Journey", "Kiss", "Madonna", "Metallica", "Motley Crue", "Oingo Boingo", "Pat Benatar", "Pet Shop Boys", "Prince", "Sheena Easton", "Taylor Dayne", "The Bangles", "The Clash", "The Cult", "The Police", "Tiffany"] 
                  })
    puzzles.push({ name: "90s Hitmakers",
                   category: category,
                   words: ["Ace of Base", "Barenaked Ladies", "Boyz II Men", "Brandy", "Bryan Adams", "C&C Music Factory", "Celine Dion", "Color Me Badd", "EMF", "Hanson", "Janet Jackson", "Kris Kross", "Lauryn Hill", "Mariah Carey", "Michael Bolton", "Nelson", "New Kids on The Block", "PM Dawn", "Ricky Martin", "Roxette", "Seal", "Spice Girls"]
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
     puzzles.each do |puzzle|
      new_puzzle = WordSearchPuzzle.find_or_create_by_name_and_category( puzzle[:name], puzzle[:category] )
      new_puzzle.words = puzzle[:words]
      #puts new_puzzle.inspect #debugging
      new_puzzle.save!
    end
  end
end