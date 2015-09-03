require 'sinatra'

get '/' do
  # TODO show some html maybe explain the API o a readme like Github's
  "Hello World!"
end

def get_random_name
	names_es = ["Juan", "María", "Pedro", "Carla", "Julio", "Jimena"]
	names_es[rand(names_es.size)]
end

def get_random_last_name
	last_names_es = ["Martínez", "Pérez", "Gómez", "Fernández", "Giménez", "Pérez"]
	last_names_es[rand(last_names_es.size)]
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/name' do
  get_random_name()
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/last_name' do
  # TODO show some html maybe explain the API o a readme like Github's
  get_random_last_name()
end

# TODO prepend the language in all API calls
# like this '/es/name'
get '/full_name' do
  last_name_first = params[:lastnamefirst]
  if !last_name_first.nil? and "true".casecmp(last_name_first) 	#FIXME false should be ignored here
  	"#{get_random_last_name()}, #{get_random_name()}"
  else
  	"#{get_random_name} #{get_random_last_name()}"
  end
end
