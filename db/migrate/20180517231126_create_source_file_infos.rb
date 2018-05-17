class CreateSourceFileInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :source_file_infos do |t|
      t.integer :source_code_info_id
      t.string :code
      t.string :relativePath

      t.timestamps
    end
  end
end
