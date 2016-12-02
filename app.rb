require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')
require('./lib/definitions')

get('/') do
  erb(:index)
end

get('/words') do
  @words_list = Words.all()
  erb(:display)
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

get('/words/:id') do
  @single_word = Words.find(params.fetch("id").to_i())
  erb(:word)
end

get('/definition/new') do
  erb(:definitions_form)
end

get('/define') do
  @definitions_list = Definitions.all()
  erb(:word)
end

get('/define/:id') do
  @definitions_list = Definitions.find(params.fetch("id").to_i())
  erb(:word)
end

post('/define') do
  user_definition = params.fetch('define_input')
  new_definition = Definitions.new(:meaning => user_definition)
  new_definition.save()
  erb(:success)
end
