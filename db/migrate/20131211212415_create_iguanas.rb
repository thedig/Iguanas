class CreateIguanas < ActiveRecord::Migration
  def change
    create_table :iguanas do |t|
      t.integer :age, :null => false
      t.date :birth_date, :null => false
      t.string :color, :null => false
      t.string :name, :null => false
      t.string :sex, :null => false, :length => 1

      t.timestamps
    end
  end
end
