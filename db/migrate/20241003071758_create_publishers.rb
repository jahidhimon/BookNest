class CreatePublishers < ActiveRecord::Migration[7.2]
  def change
    create_table :publishers do |t|
      t.string :description, null: false
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
