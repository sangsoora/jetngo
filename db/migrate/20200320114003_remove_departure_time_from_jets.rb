class RemoveDepartureTimeFromJets < ActiveRecord::Migration[5.2]
  def change
    remove_column :jets, :departure_time
  end
end
