class AddAcceptedToDates < ActiveRecord::Migration
  def change
    add_column :dates, :accepted, :boolean, default: false
  end
end
