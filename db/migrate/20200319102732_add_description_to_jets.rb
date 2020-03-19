class AddDescriptionToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :description, :text
  end
end
