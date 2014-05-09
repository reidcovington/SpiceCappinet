require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class CreateSpice < ActiveRecord::Migration
  def change
    create_table :spices do |s|
      s.string :name
      s.integer :quantity, default: 100
      s.timestamps
    end
  end
end
