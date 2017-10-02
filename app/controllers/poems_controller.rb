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

get '/poems/:id/edit' do
  @poem = Poem.find(params[:id])
  erb :'/poems/edit'
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
  Poem.create(params[:poem])
  redirect '/poems'
end
