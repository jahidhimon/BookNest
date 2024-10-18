class CreateLendings < ActiveRecord::Migration[7.2]
  def change
    create_table :lendings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :return_date, null: false, default: 0
      t.date :returned_date
      t.integer :penalty, null: false, default: 0

      t.timestamps
    end
  end
end
