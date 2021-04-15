class AddAttributesToCsvImports < ActiveRecord::Migration[6.1]
  def change
    add_column :csv_imports, :file_name, :string
    add_column :csv_imports, :state, :string
  end
end
