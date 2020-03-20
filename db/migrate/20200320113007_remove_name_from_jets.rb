class RemoveNameFromJets < ActiveRecord::Migration[5.2]
  def change
    remove_column :jets, :name
  end
end
