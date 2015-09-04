class RandomNameGenerator
	#TODO extract to file
	def get_random_name
		names_es = ["Juan", "María", "Pedro", "Carla", "Julio", "Jimena"]
		names_es[rand(names_es.size)]
	end

	def get_random_last_name
		last_names_es = ["Martínez", "Pérez", "Gómez", "Fernández", "Giménez", "Pérez"]
		last_names_es[rand(last_names_es.size)]
	end
end