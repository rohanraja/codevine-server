class CreateVarInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :var_instances do |t|
      t.string :name
      t.string :vartype

      t.timestamps
    end
  end
end
