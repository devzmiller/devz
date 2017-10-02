get '/' do
  redirect '/poems'
end

get '/poems' do
  @poems = Poem.all
  erb :'/poems/index'
end

get '/poems/new' do
  erb :'/poems/new'
end

get '/poems/:id' do
  @poem = Poem.find(params[:id])
  erb :'/poems/show'
end

delete '/poems/:id' do
  @poem = Poem.find(params[:id])
  @poem.destroy
  redirect '/poems'
end

post '/poems' do
  Poem.create(params[:poem])
  redirect '/poems'
end
