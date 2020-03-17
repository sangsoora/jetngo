class CreateJets < ActiveRecord::Migration[5.2]
  def change
    create_table :jets do |t|
      t.string :name
      t.string :model
      t.integer :capacity
      t.integer :unit_price
      t.references :user, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
