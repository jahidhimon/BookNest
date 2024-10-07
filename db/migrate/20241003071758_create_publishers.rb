class CreatePublishers < ActiveRecord::Migration[7.2]
  def change
    create_table :publishers do |t|
      t.string :year_of_publication
      t.string :name

      t.timestamps
    end
  end
end
