require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')
require('./lib/definitions')

get('/') do
  @words_list = Words.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  new_word = params.fetch('word_input')
  create_word = Words.new(:word => new_word)
  create_word.save()
  erb(:success)
end

get('/define/:id') do
  @single_word = Words.find(params.fetch("id").to_i())
  erb(:word)
end

get('/define/:id/form_definition') do
  @single_word = Words.find(params.fetch("id").to_i())
  erb(:definitions_form)
end

post('/define/:id/word_define') do
  @single_word = Words.find(params.fetch("id").to_i())
  user_definition = params.fetch('define_input')
  new_definition = Definitions.new(:meaning => user_definition)
  @single_word.save_definition(new_definition)
  erb(:word)
end

get('/clear_list') do
  @words_list = []
  erb(:index)
end
