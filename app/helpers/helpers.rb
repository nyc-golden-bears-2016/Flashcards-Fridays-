helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def deck_creator?
    if Deck.find_by(creator_id: current_user).creator == current_user
      true
    else
      false
    end
  end

  def guest_user
    !!/\A(GUEST).{8}/.match(current_user.username)
  end

end
