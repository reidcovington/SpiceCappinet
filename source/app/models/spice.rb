class Spice < ActiveRecord::Base
  validates :name, :presence => true
  validates :amount, :presence => true

  belongs_to :cappinet
end
