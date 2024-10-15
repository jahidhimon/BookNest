class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :title, null: false
      t.string :edition, null: false
      t.string :year_of_publication, null: false
      t.string :category, null: false
      t.text :description, null: false
      t.boolean :available, null: false
      t.integer :visits, null: false, default: 0
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
