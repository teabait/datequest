class CreateDates < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.datetime :date_time, null: false
      t.string :location
      t.integer :date_creator, null:false
      t.integer :date_acceptor, null:false
    end
  end
end
