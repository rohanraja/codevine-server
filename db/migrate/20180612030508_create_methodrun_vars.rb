class CreateMethodrunVars < ActiveRecord::Migration[5.1]
  def change
    create_table :methodrun_vars do |t|
      t.integer :var_instance_id
      t.integer :method_run_id

      t.timestamps
    end
  end
end
