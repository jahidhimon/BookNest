class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :ISBN
      t.string :title
      t.string :edition
      t.string :category
      t.float :price
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
