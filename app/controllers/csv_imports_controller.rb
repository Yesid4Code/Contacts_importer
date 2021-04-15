class CsvImportsController < ApplicationController

  def index
    @csv_imports = CsvImport.all
  end

  def new
    @csv_import = CsvImport.new
  end
  
  def import
    @csv_import = current_user.csv_imports.build(file_name: params[:file].original_filename)
    @csv_import.save
    @csv_import.import(params[:file], current_user)
    redirect_to contacts_path, notice: "Contacts were successfully imported."
  end
  
end
