# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    #The value of the menus table
    create_table :menus do |t|
      t.string :title
      t.text :body
      t.decimal :price

      t.timestamps
    end
  end
end
