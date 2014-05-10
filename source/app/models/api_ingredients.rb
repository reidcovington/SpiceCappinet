# require_relative '../config/application'

# 5befa6ed
# 0c3ca411c5b1eb7785526ffcf84ce939

# curl -o recipies.txt -H "X-Yummly-App-ID: 5befa6ed" -H "X-Yummly-App-Key: 0c3ca411c5b1eb7785526ffcf84ce939" http://api.yummly.com/v1/api/recipes?_app_id=app-id&_app_key=app-key&allowedIngredient[]=cumin

class RecipieGetter

	def self.query_builder(ingredients)
		search_parameters = ""
		ingredients.each { |ingredient| search_parameters += "&allowedIngredient[]=#{ingredient}" }
		search_parameters
	end

	def self.pull_recipie(*ingredients)
		search = """curl -o recipies.txt -H 'X-Yummly-App-ID: 5befa6ed' -H 'X-Yummly-App-Key: 0c3ca411c5b1eb7785526ffcf84ce939' http://api.yummly.com/v1/api/recipes?_app_id=app-id&_app_key=app-key""" + query_builder(ingredients)
		`#{search}`
	end
end


puts RecipieGetter.pull_recipie("rum")