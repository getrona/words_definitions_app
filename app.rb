require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')

get('/') do
  erb(:index)
end

get('/words/new/form') do
  erb(:words_form)
end

post('/words') do
  new_word = params.fetch('word_input')
  create_word = Words.new(:word => new_word)
  create_word.save()
  erb(:success)
end

get('/words') do
  @words_list = Words.all()
  erb(:index)
end
