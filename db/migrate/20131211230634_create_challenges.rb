class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :description, null: false
      t.string :level
    end
  end
end
