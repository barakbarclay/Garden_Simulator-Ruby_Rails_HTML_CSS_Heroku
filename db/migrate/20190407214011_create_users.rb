# Migration responsible for re-creating the users table
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :name
      table.string :email
      table.string :password
      table.integer :gold
      table.integer :currentPlotSelected
      table.integer :currentPlantSelected
      table.boolean :isPlanting
      table.timestamps
    end
  end
end