helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def deck_creator
    if Deck.find(params[:creator_id]).creator == current_user
      true
    else
      false
    end
  end

end
