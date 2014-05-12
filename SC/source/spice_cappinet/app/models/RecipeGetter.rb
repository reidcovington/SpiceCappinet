require_relative '../../config/application'

require 'open-uri'
require 'JSON'

class RecipeGetter

  def self.query_builder(meal, required_spices)
    search_parameters = "&q="

    meal_type = meal

    spices = required_spices.split(" ")

    case meal_type
    when 'B'
    	search_parameters += 'Breakfast'
    when 'L'
    	search_parameters += 'Lunch'
    when 'D'
    	search_parameters += 'Dinner'
    when 'A'
    	search_parameters = ""
    else
    	'Please enter a valid meal type'
    end    

   	spices.each { |spice| search_parameters += "&allowedIngredient[]=#{spice}" }
   	search_parameters
  end

  def self.pull_recipe(query)
		search = "http://api.yummly.com/v1/api/recipes?_app_id=5befa6ed&_app_key=0c3ca411c5b1eb7785526ffcf84ce939" + query
		puts search
		result = JSON.load(open(search))
  end

  def self.list_recipe_names(json_results)
		counter = 1

		json_results["matches"].each do |recipe|
			puts
			puts
			puts "#{counter}: " + recipe["recipeName"]
			puts
			counter += 1
			(recipe["recipeName"].length + 5).times { print "=" }
		end
	end
end

