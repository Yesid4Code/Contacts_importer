class RemoveColumnInvalidRecordFromCsvImports < ActiveRecord::Migration[6.1]
  def change
    remove_column :csv_imports, :invalid_record, :text
  end
end
