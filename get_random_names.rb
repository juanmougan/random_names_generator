require 'sinatra'
require 'sinatra/respond_with'
require 'json'
require_relative 'random_name_generator'

before do
    #content_type :json
    @random_name_generator = RandomNameGenerator.new
end

after do
  response.body = JSON.dump(response.body)
end

not_found do
  status 404
  #erb :oops
  { :error => "This page could not be found" }
end

#get '/' do
  # TODO show some html maybe explain the API o a readme like Github's
#  "Hello World!"
#end

get '/' do
  data = { :name => 'example' }
  puts headers
  request.accept.each do |type|
    puts "Type is: #{type}"
    case type
    when 'text/html'
        halt haml(:index, :locals => data)
        puts 'text/html'
    when 'application/json'
        halt data.to_json
        puts 'text/json'
    when 'application/atom+xml'
      halt nokogiri(:'index.atom', :locals => data)
    when 'application/xml', 'text/xml'
      halt nokogiri(:'index.xml', :locals => data)
    when 'text/plain'
      halt 'just an example'
    end
  end
  puts 'error'
  error 406
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/name' do
  #respond_with :index, :name => 'example' do |f|
  #  f.txt { @random_name_generator.get_random_name() }
  #end
  get_name_as_json
end

def get_name_as_json
  { :name => @random_name_generator.get_random_name() }
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
