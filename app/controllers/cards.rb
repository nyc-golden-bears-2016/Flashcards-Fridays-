post '/cards/:id' do
 halt(401, "You must be logged in to a valid account in order to create a deck.") unless logged_in? && !guest_user
 card = Card.create(params[:card].merge(deck_id: params[:id]))
 @errors = card.errors.full_messages
 redirect "/decks/#{card.deck.id}"
end

put '/cards/:id' do
  halt(401, "You did not create this deck.") unless logged_in? && !guest_user && deck_creator?
	card = Card.find(params[:id])
  card.update_attributes(deck: card.deck, creator: card.creator, question: params[:question], answer: params[:answer])
  @errors = card.errors.full_messages
  redirect "/decks/#{card.deck.id}"
end

delete '/cards/:id' do
  halt(401, "You did not create this deck.") unless logged_in? && !guest_user && deck_creator?
	card = Card.find(params[:id])
  card.destroy
  @errors = card.errors.full_messages
  redirect "/decks/#{card.deck.id}"
end
