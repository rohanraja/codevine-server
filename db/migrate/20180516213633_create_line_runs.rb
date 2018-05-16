class CreateLineRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :line_runs do |t|
      t.integer :lineNo
      t.datetime :timeStamp
      t.integer :method_run_id

      t.timestamps
    end
  end
end
