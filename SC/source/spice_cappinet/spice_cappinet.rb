require_relative 'config/application'

# require 'active_record'

# class Cappinet < ActiveRecord::Base
#   has_many :spices

#   def self.show_cabinet
#     Spice.all.each { |s| puts "#{s.name}" + " #{s.quantity}" }
#   end

#   def self.included?(spice_name)
#     return true if Spice.all.select { |spice| spice.name == spice_name } != []
#     false
#   end

#   def self.give_quantity(spice_name)
#     if self.included?(spice_name) == true
#       return Spice.all.select { |spice| spice.name == spice_name }.first.quantity
#     else
#       puts "You don't have that spice"
#     end
#   end

#   def self.add(spice_name)
#     if self.included?(spice_name)
#       spice = Spice.where(name: spice_name).first
#       spice[:quantity] += 100
#       spice.save
#     else
#       Spice.create(name: spice_name, cappinet_id: 1)
#     end
#   end

#   def self.remove(spice_name)
#     Spice.where(name: spice_name).first.destroy
#   end

#   def self.update_amount(spice_name, amount_used)
#     spice = Spice.where(name: spice_name).first
#     spice.quantity -= amount_used
#     spice.save
#   end

#   def self.recipe(ingredients)
#     # raise "Enter a hash bruh" unless ingredients.class == Hash
#     ingredients.each do |item, quantity|
#       if self.included?(item)==true && self.give_quantity(item) >= quantity
#         puts "You're all set with #{item}!"
#       else
#         puts "Go get some more #{item} bruh"
#       end
#     end
#     "Enjoy bruh"
#   end

# end

class UI
  def self.welcome_prompt
    puts "~" * 60
    puts "~            WELCOME TO YOUR SPICE CAPPINET!               ~"
    puts "~" * 60
  end

  def self.user_prompt
    puts "\n\t 1. Type LIST to view the spices in your Cappinet"
    puts "\t 2. Type ADD to add a new spice to your Cappinet"
    puts "\t 3. Type REMOVE to remove a spice from your Cappinet"
    puts "\t 4. Type UPDATE to edit a spice's quantity"
    puts "\t 5. Type CHECK to see if you have a spice"
    puts "\t 6. Type QUANTITY to see a spice's quantity"
    puts "\t 7. Type RECIPE to check if you have the spices for a recipe"
    puts "\t 8. Type QUIT to leave"
    response = gets.chomp.upcase
    case response
    when 'LIST'
      puts "Here are your spices:"
      Cappinet.show_cabinet
    when 'ADD'
      puts "What spice would you like to add?"
      Cappinet.add(gets.chomp.downcase)
    when 'REMOVE'
      Cappinet.show_cabinet
      puts "What spice would you like to remove?"
      Cappinet.remove(gets.chomp.downcase)
    when 'UPDATE'
      Cappinet.show_cabinet
      puts "What spice quantity would you like to update?"
      spice_name = gets.chomp.downcase
      puts "How much #{spice_name} did you use?"
      amount_used = gets.chomp.downcase
      Cappinet.update_amount(spice_name, amount_used)
    when 'CHECK'
      puts "What spice would you like to check?"
      Cappinet.included?(gets.chomp.downcase)
    when 'QUANTITY'
      puts "What spice's quantity would you like to check?"
      Cappinet.give_quantity(gets.chomp.downcase)
    when 'RECIPE'
      puts "Let's if you have sufficient amount of a spice for your recipe..."
      Cappinet.recipe
    when 'QUIT'
      puts "See ya! Wouldn't want to be ya!"
      exit
    else
      puts "That's no valid command bruh"
    end
    "Peace out"
  end
end

class Program
  def self.run!
    UI.welcome_prompt
    begin
    response = UI.user_prompt
    end while response != "QUIT"
  end
end


##### TEST CODE #####

def assert(actual, expected)
  actual == expected
end

###### DRIVER CODE #######

# Cappinet.add('Cumin')
# Cappinet.included?('Bah')

# spice = Spice.where(name: 'Cumin').first

# assert(Cappinet.where(name: 'Cumin'), 'Cumin')
# Cappinet.add('Cumin')
# assert(Cappinet.where(quantity: 200), 200)

# Cappinet.add('Tumeric')

# Cappinet.remove('Cumin')
# assert(Spice.all.include?('Cumin'), false)

# Cappinet.update_amount('Tumeric', 10)
# assert(Spice.where(name: 'Tumeric'), 90)

# Cappinet.show_cabinet

# Cappinet.give_quantity('Tumeric')

# puts Cappinet.recipe({'Tumeric' => 300, 'Coriander' => 60})

# puts
# puts '============'
# puts 'Tests Passed'
# puts '============'


Program.run!


