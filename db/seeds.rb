Deck.create(subject: "test")

5.times do Card.create(question: "What is your favorite color?", answer: "yellow", deck_id: Deck.last.id)
end
