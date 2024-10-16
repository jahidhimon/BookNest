class CreateLendings < ActiveRecord::Migration[7.2]
  def change
    create_table :lendings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :return_date
      t.datetime :returned_date
      t.integer :penalty

      t.timestamps
    end
  end
end
