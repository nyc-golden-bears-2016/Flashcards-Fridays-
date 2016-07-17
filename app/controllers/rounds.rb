get '/rounds/start/:id' do
  round = Round.create(user_id: current_user.id, deck_id: params[:id])
  session[:counter] = 0
  redirect "/rounds/#{round.id}"
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  cards = Card.all.where(deck_id: @round.deck_id)
  @question = cards[session[:counter]%cards.length].question
  erb :'rounds/show'
end

put '/rounds' do
  round = Round.find(params[:round])
  cards = Card.where(deck_id: round.deck_id)
  answer = params[:answer]
  card = cards[session[:counter] % cards.length]
  if Guess.all.where(round_id: round.id)[0].nil?
    Guess.create_blank_guesses(cards.length, round.id, cards)
  end
  guess = Guess.create(round_id: round.id, card_id: card.id)
  if card.answer.downcase == answer.downcase
    guess.correctness = true
    guess.save
  else
    guess.correctness = false
    guess.save
  end

  if Guess.all.where(round_id: round.id, correctness: true).length >= cards.length
    redirect "/users/#{round.user_id}"
  end

  begin
    if Guess.find_by(card_id: card.id, round_id: round.id).correctness
      session[:counter] += 1
      card = cards[session[:counter] % cards.length]
    else
      session[:counter] += 1
      redirect "/rounds/#{round.id}"
    end
  end while 1 == 1
end
