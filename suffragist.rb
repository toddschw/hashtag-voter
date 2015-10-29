require 'sinatra'

Choices = {
  'tag1' => '#wyn #1',
  'tag2' => '#wyn #2',
  'tag3' => '#wyn #3'
}

get '/' do
  @title = 'Welecome to HashTag Voting!'
  erb :index
end

post '/cast' do
  @title = 'Thanks for casting your vote'
  @vote = params['vote']
  erb :cast
end

get '/results' do
  @title = "Here are the results:"
  @votes = { 'tag1' => 7, 'tag2' => 5, 'tag3' => 3 }
  erb :results
end
