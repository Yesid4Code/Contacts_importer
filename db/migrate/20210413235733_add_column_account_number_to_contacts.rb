class AddColumnAccountNumberToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :account_number, :string
  end
end
