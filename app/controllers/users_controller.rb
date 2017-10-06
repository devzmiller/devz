get '/users/new' do
  if request.xhr?
    erb :'/users/new', layout: false
  else
    erb :'/users/new'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if request.xhr?
    if @user.valid?
      @user.save
      erb :'/sessions/new', layout: false
    else
      @errors = @user.errors
      erb :'/users/new'
    end
  else
    if @user.valid?
      @user.save
      redirect '/sessions/new'
    else
      @errors = @user.errors
      erb :'/users/new'
    end
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
