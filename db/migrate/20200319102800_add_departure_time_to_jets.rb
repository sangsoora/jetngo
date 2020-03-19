class AddDepartureTimeToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :departure_time, :time
  end
end
