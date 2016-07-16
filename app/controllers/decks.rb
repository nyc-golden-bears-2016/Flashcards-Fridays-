

get '/rounds/start/:id' do
  round = Round.create(user_id: current_user.id, deck_id: params[:id])

  session[:counter] = 0
  redirect "/rounds/#{round.id}"
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  @question = Card.all.where(deck_id: @round.deck_id)[session[:counter]].question
  erb :'decks/show'
end

put '/rounds' do
  round = Round.find(params[:round])
  cards = Card.where(deck_id: round.deck_id)
  answer = params[:answer]
  card = cards[session[:counter] % cards.length]
  guess = Guess.create(round_id: round.id, card_id: card.id)
  if card.answer == answer
    guess.correctness = true
    guess.save
  else
    guess.correctness = false
    guess.save
  end

  begin
    if Guess.find_by(card_id: card.id, round_id: round.id).correctness
      if Guess.all.where(round_id: round.id, correctness: true).length == cards.length
        redirect "/users/show"
      end
      session[:counter] += 1
      card = cards[session[:counter] % cards.length]
    else
      session[:counter] += 1
      redirect "/rounds/#{round.id}"
    end
  end while (Guess.find_by(card_id: card.id, round_id: round.id).correctness) && Guess.find_by(card_id: card.id, round_id: round.id).correctness
  redirect "/rounds/#{round.id}"
end
