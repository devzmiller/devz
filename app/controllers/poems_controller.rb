get '/' do
  redirect '/poems'
end

get '/poems' do
  @poems = Poem.all
  erb :'/poems/index'
end

get '/poems/new' do
  if session[:user_id]
    erb :'/poems/new'
  else
    redirect '/sessions/new'
  end
end

get '/poems/:id' do
  @poem = Poem.find(params[:id])
  erb :'/poems/show'
end

get '/poems/:id/edit' do
  @poem = Poem.find(params[:id])
  if @poem.user_id == session[:user_id]
    erb :'/poems/edit'
  else
    redirect '/sessions/new'
  end
end

delete '/poems/:id' do
  @poem = Poem.find(params[:id])
  @poem.destroy
  redirect '/poems'
end

put '/poems/:id' do
  @poem = Poem.find(params[:id])
  @poem.title = params[:title]
  @poem.body = params[:body]
  @poem.save
  redirect '/poems'
end

post '/poems' do
  if session[:user_id]
    poem = Poem.create(title: params[:title], body: params[:body], user_id: session[:user_id])
    redirect "poems/#{poem.id}"
  else
    redirect "/sessions/new"
  end
end
