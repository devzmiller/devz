get '/' do
  redirect '/poems'
end

get '/poems' do
  @poems = Poem.all
  erb :'/poems/index'
end
