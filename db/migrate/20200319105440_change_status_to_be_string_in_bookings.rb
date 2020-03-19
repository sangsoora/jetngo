class ChangeStatusToBeStringInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, :string
  end
end
