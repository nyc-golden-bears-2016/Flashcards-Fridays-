get '/decks/new' do
  erb :'decks/new'
end

post '/decks' do
 halt(401, "You must be logged in to a valid account in order to create a deck.") unless logged_in? && !guest_user
 deck = Deck.new(params[:deck].merge(creator: current_user))
 if deck.save
   card = Card.new(params[:card].merge(deck_id: deck.id))
   if card.save
     redirect "/decks/#{deck.id}"
   else
     @errors = card.errors.full_messages
     erb :'/decks/new'
   end
 else
    @errors = deck.errors.full_messages
    erb :'/decks/new'
  end
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  halt(401, "You did not create this deck.") unless logged_in? && !guest_user && deck_creator?
  erb :'/decks/show'
end

delete '/decks/:id' do
  @deck = Deck.find(params[:id])
  halt(401, "You did not create this deck.") unless logged_in? && !guest_user && deck_creator?
  @deck.destroy
  redirect "/users/#{current_user.id}"
end
