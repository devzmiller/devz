get '/sessions/new' do
  if request.xhr?
    erb :'/sessions/new', layout: false
  else
    erb :'/sessions/new'
  end
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user == nil
    @error = "Invalid username or password"
    erb :'/sessions/new'
  else
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/poems'
end
