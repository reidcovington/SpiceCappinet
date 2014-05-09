require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class CreateCappinet < ActiveRecord::Migration
  def change
    create_table :cappinet do |c|
      c.string :name
      c.timestamps
    end
  end
end
