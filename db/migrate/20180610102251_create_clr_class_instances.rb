class CreateClrClassInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :clr_class_instances do |t|
      t.string :instanceId
      t.string :className
      t.timestamps
    end
  end
end
