# frozen_string_literal: true

class DeviseCreateLibrarians < ActiveRecord::Migration[7.2]
  def change
    create_table :librarians do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.datetime :remember_created_at

      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :librarians, :email, unique: true
  end
end
