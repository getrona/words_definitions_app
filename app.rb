require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')

get('/') do
  erb(:index)
end

get('/words/form') do
  erb(:words_form)
end

post('/words') do
  
  erb(:success)
end
