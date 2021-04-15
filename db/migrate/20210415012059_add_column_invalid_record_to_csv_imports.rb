class AddColumnInvalidRecordToCsvImports < ActiveRecord::Migration[6.1]
  def change
    add_column :csv_imports, :invalid_record, :text
  end
end
