class CreateValueHolders < ActiveRecord::Migration[5.1]
  def change
    create_table :value_holders do |t|
      t.string :rawValue
      t.integer :timeStamp
      t.integer :var_instance_id
      t.timestamps
    end
  end
end
