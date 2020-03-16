class CreateJets < ActiveRecord::Migration[5.2]
  def change
    create_table :jets do |t|
      t.string :name
      t.integer :capacity
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
