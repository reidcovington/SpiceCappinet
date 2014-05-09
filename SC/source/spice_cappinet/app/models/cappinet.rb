require_relative '../../config/application'

require 'active_record'

class Cappinet < ActiveRecord::Base
  has_many :spices

  def self.show_cabinet
    Spice.all.each { |s| puts "#{s.name}" + " #{s.quantity}" }
  end

  def self.included?(spice_name)
    if Spice.all.select { |spice| spice.name == spice_name } != []
      puts "Your in luck! You have #{spice_name}"
      return true
    else
      false
    end
  end

  def self.give_quantity(spice_name)
    if self.included?(spice_name) == true
      ammount = Spice.all.select { |spice| spice.name == spice_name }.first.quantity
      puts "You have #{ammount} #{spice_name}"
    else
      puts "You don't have that spice"
    end
  end

  def self.add(spice_name)
    if self.included?(spice_name)
      spice = Spice.where(name: spice_name).first
      spice[:quantity] += 100
      spice.save
      puts "You just added 100 of #{spice_name}"
    else
      Spice.create(name: spice_name, cappinet_id: 1)
      puts "You just added #{spice_name}"
    end
  end

  def self.remove(spice_name)
    Spice.where(name: spice_name).first.destroy
    puts "You just removed #{spice_name}"
  end

  def self.update_amount(spice_name, amount_used)
    spice = Spice.where(name: spice_name).first
    spice.quantity -= amount_used.to_i
    spice.save
    puts "You just used #{amount_used} #{spice_name}"
  end

  def self.recipe
    # raise "Enter a hash bruh" unless ingredients.class == Hash
    puts "What ingredient?"
    item = gets.chomp
    puts "What quantity"
    quantity = gets.chomp
    ingredients_hash = {item => quantity}
    ingredients_hash.each do |item, quantity|
      if self.included?(item)==true && self.give_quantity(item) >= quantity
        puts "You're all set with #{item}!"
      else
        puts "Go get some more #{item} bruh"
      end
    end
    "Enjoy bruh"
  end
end

