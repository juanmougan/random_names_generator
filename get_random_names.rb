require 'sinatra'
require_relative 'random_name_generator'

before do
    @random_name_generator = RandomNameGenerator.new
end

not_found do
  status 404
  #erb :oops
  "This page could not be found"
end

get '/' do
  # TODO show some html maybe explain the API o a readme like Github's
  "Hello World!"
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/name' do
  @random_name_generator.get_random_name()
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/last_name' do
  @random_name_generator.get_random_last_name()
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/full_name' do
  last_name_first = params[:lastnamefirst]
  if !last_name_first.nil? and "true".casecmp(last_name_first)  #FIXME false should be ignored here
    "#{@random_name_generator.get_random_last_name()}, #{@random_name_generator.get_random_name()}"
  else
    "#{@random_name_generator.get_random_name} #{@random_name_generator.get_random_last_name()}"
  end
end

