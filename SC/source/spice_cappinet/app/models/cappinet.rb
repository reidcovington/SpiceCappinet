require_relative '../config/application'

class Cappinet < ActiveRecord::Base
  has_many :spices
end
