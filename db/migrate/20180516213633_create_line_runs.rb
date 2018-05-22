class CreateLineRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :line_runs do |t|
      t.integer :lineNo
      t.integer :timeStamp
      t.integer :method_run_id
      t.string :methodRunningState, :default => "RUNNING"
      t.timestamps
    end
  end
end
