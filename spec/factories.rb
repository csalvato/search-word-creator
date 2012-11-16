FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"} 
    password "foobar"
    password_confirmation "foobar"
  end

  factory :word_search_puzzle do
    words   ["ALLIGATOR", "CROCODILE", "LOBSTER", "ANACONDA", "EARTHWORM",
             "PYTHON", "BOA", "GECKO", "RATTLESNAKE", "BULLDOG", "BULLFROG",
             "HERMITCRAB", "SANDLIZARD", "GILAMONSTER", "SALAMADER","TADPOLE",
             "TOAD","CHAMELEON","IGUANA","SHARK","TORTOISE","COBRA",
             "KOMODODRAGON","SPIDER","TURTLE"]
    sequence(:name) { |n| "puzzle #{n}" }
  end

end