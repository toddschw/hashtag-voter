require 'sinatra'
require 'yaml/store'



Choices = {
  'tag1' => '#wyndough',
  'tag2' => '#damons_lil_demons',
}

get '/' do
  @title = 'Welecome to HashTag Voting!'
  erb :index
end

post '/cast' do
  @title = 'Thanks for casting your vote'
  @vote = params['vote']
  @store = YAML::Store.new 'votes.yml'
  @store.transaction do
    @store['votes'] ||= {}
    @store['votes'][@vote] ||= 0
    @store['votes'][@vote] += 1
  end
  erb :cast
end

get '/results' do
  @title = "Here are the results so far:"
  @store = YAML::Store.new 'votes.yml'
  @votes = @store.transaction { @store['votes']}
  erb :results
end

get '/suggest' do
  @title = "Suggest a new hashtag"
  erb :suggest
end

post '/suggest' do
  @title = 'Your suggestion is submitted'
  @suggestion = params["hashtag"]
  l = Choices.length
  new_tag = "tag #{l}"
  Choices["#{new_tag}"] = @suggestion
  erb :gotit
end

get '/votes.yml' do
  ??
end
