require_relative '../../config/application'

class Spice < ActiveRecord::Base
  belongs_to :cappinet
end
