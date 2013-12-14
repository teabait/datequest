class AddDescriptionToDates < ActiveRecord::Migration
  def change
    add_column :dates, :description, :string, null: false
  end
end
