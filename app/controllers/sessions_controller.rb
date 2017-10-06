get '/sessions/new' do
  if request.xhr?
    erb :'/sessions/new', layout: false
  else
    erb :'/sessions/new'
  end
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if request.xhr?
    if user == nil
      '<p id="login-error">Invalid username or password</p>'
    else
      session[:user_id] = user.id
      "/users/#{user.id}"
    end
  else
    if user == nil
      @error = "Invalid username or password"
      erb :'/sessions/new'
    else
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    end
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/poems'
end
