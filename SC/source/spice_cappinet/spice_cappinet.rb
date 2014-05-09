require_relative '/Users/apprentice/Desktop/SpiceCappinet/SC/source/spice_cappinet/config/application'

require 'active_record'

class Cappinet < ActiveRecord::Base
  has_many :spices

  def self.show_cabinet
    Spice.all.each { |s| puts "#{s.name}" + " #{s.quantity}" }
  end

  def self.add(spice_name)
    query = Spice.all.select { |spice| spice.name == spice_name }

    if query.map { |spice| spice.name }.include?(spice_name)
      spice = Spice.where(name: spice_name)
      spice.quantity += 100
      spice.save
    else
      Spice.create(name: spice_name, cappinet_id: 1)
    end
  end

  def self.remove(spice_name)
    spice = Spice.where(name: spice_name)
    destroy(spice)
  end

  def self.update_amount(spice_name, amount_used)
    spice.quantity -= amount_used
    spice.save
  end
end

class Spice < ActiveRecord::Base
  validates :name, presence: :true
  belongs_to :cappinet
end


# DRIVER CODE

def assert(actual, expected)
  actual == expected
end


Cappinet.add('Cumin')
assert(Cappinet.where(name: 'Cumin'), 'Cumin')
Cappinet.add('Cumin')
assert(Cappinet.where(quantity: 200), 200)



Cappinet.add('Tumeric')
Cappinet.show_cabinet

Cappinet.remove('Cumin')
assert(Spice.all.include?('Cumin'), false)

Cappinet.update_amount('Tumeric', 10)
assert(Spice.where(name: 'Tumeric'), 90)


puts
puts '============'
puts 'Tests Passed'
puts '============'
