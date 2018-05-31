class CreateMethodRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :method_runs do |t|
      t.string :mrid
      t.string :relativeFilePath
      t.string :methodName
      t.string :threadid

      t.timestamps
    end
  end
end
