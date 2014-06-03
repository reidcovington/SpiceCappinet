class CreateCappinets < ActiveRecord::Migration
  def change
    create_table :cappinets do |c|
      c.belongs_to :user
      c.string :name
      c.text :description

      c.timestamps
    end
  end
end
