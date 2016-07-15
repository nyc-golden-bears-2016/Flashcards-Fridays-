
10.times { User.create!(username: Faker::Superhero.name, password: SecureRandom.hex(10)) }

10.times { Deck.create!(subject: Faker::Hipster.word, creator_id: rand(1..10)) }

70.times { Card.create!(question: Faker::Hipster.sentence + "?", answer: Faker::ChuckNorris.fact, deck_id: rand(1..10))}

