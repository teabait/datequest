class AddRequirementToMessages < ActiveRecord::Migration
  def change
    change_column :messages, :sender_id, :integer, null: false
    change_column :messages, :receiver_id, :integer, null: false
    change_column :messages, :content, :string, null: false
  end
end
