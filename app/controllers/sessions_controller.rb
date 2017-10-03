get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user == nil
    @error = "Invalid username or password"
    erb :'/sessions/new'
  else
    redirect "/users/#{user.id}"
  end
end
