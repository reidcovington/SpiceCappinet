require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :complete, :default => false
      t.timestamps
    end
  end
end
