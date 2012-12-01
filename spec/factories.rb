FactoryGirl.define do
  factory :user do
    first_name = ('a'..'z').to_a.shuffle[0..7].join
    last_name = ('a'..'z').to_a.shuffle[0..7].join
    sequence(:name) { "#{first_name} #{last_name}" }
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

  factory :subscription do
    user
  end
end