class CreateSpices < ActiveRecord::Migration
  def change
    create_table :spices do |s|
      s.belongs_to :cappinet
      s.string :name
      s.text :notes
      s.string :amount

      s.timestamps
    end
  end
end
