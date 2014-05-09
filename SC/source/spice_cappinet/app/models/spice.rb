require_relative '../../config/application'

class Spice < ActiveRecord::Base
  validates :name, presence: :true
  belongs_to :cappinet
end
