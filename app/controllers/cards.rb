get '/cards' do
	erb :'cards/index'
end

get '/cards/new' do
	erb :'cards/new'
end

get '/cards/:id' do
	@card = Deck.find(card_id: params[:id])
	erb :'cards/show'
end

post '/cards' do
	card = Card.new(params[:card])
	if card.save
		deck = Deck.find(card.deck_id)
		redirect "/decks/#{deck.id}"
	else
		@errors = card.errors.full_messages
		redirect '/cards/new'
	end
end

get '/cards/:id/edit' do
	erb :'cards/edit'
end

put '/cards/:id' do
	card = Card.find(params[:id])
	card.update_attributes(params[:card])
	if card.save
		redirect "/cards/#{params[:id]}"
	else
		@errors = card.errors.full_messages
		redirect "/cards/#{params[:id]}/edit"
	end
end

delete '/cards/:id' do
	card = Card.find(params[:id])
	deck = card.deck
	card.destroy
	redirect "/deck/#{deck.id}"
end