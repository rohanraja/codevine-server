class CreateClrclassVars < ActiveRecord::Migration[5.1]
  def change
    create_table :clrclass_vars do |t|
      t.integer :var_instance_id
      t.integer :clr_class_instance_id

      t.timestamps
    end
  end
end
