get '/' do
  redirect '/poems'
end

get '/poems' do
  @poems = Poem.all
  erb :'/poems/index'
end

get '/poems/:id' do
  @poem = Poem.find(params[:id])
  erb :'/poems/show'
end
