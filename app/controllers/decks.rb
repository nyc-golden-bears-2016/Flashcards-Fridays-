get '/decks/start/:id' do
  Round.create(user_id: current_user.id, deck_id: params[:id])
  session[:counter] = 0
  redirect "/decks/#{Round.deck_id}"
end
get '/decks/:id' do
  @question = Card.all[session[:counter]].question
  erb :'decks/show'
end

put '/rounds' do
  guess = Guess.create(Round.find)
  answer = params[:answer]
  if Card.all[session[:counter]].answer == answer
    guess.correctness = true
    guess.save
  else
    guess.correctness = false
    guess.save
  end
  session[:counter] += 1
  if Guess.all.where(correctness: true).length == Card.all.length
    redirect '/user/show'
  else
    redirect "/decks/#{}"
  end
end
