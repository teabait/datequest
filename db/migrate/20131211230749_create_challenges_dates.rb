class CreateChallengesDates < ActiveRecord::Migration
  def change
    create_table :challenges_dates do |t|
      t.boolean :complete, default: false
      t.integer :completer_id
      t.references :challenge
      t.references :date

      t.timestamps
    end
  end
end
