get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    redirect '/sessions/new'
  else
    @errors = @user.errors
    erb :'/users/new'
  end
end
