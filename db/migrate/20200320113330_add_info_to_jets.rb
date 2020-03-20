class AddInfoToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :size, :string
    add_column :jets, :speed, :integer
    add_column :jets, :range, :integer
    add_column :jets, :flight_time, :integer
  end
end
