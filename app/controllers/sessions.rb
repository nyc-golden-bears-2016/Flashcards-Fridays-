get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      @errors = ["Information not found. Please retry or register."]
      erb :'/sessions/new'
    end
end

delete '/sessions' do
  session.clear
  redirect '/'
end

get '/sessions/guest/new' do
  user = User.create(username: "GUEST" + SecureRandom.hex(4), password: SecureRandom.hex(10))
  session[:user_id] = user.id
  redirect '/'
end
