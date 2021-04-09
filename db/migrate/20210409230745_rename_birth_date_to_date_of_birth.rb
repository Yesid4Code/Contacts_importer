class RenameBirthDateToDateOfBirth < ActiveRecord::Migration[6.1]
  def change
    rename_column :contacts, :birth_date, :date_of_birth
  end
end
