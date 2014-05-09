require_relative '/Users/apprentice/Desktop/SpiceCappinet/SC/source/spice_cappinet/config/application'

class Cappinet < ActiveRecord::Base
  has_many :spices
end
