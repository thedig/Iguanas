class CreateIguanaHouseCleaningRequests < ActiveRecord::Migration
  def change
    create_table :iguana_house_cleaning_requests do |t|
      t.integer :iguana_id, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.string :status, :null => false

      t.timestamps
    end

    add_index :iguana_house_cleaning_requests, :iguana_id
  end
end
