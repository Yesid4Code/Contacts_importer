class RenameCreditCartToCreditCard < ActiveRecord::Migration[6.1]
  def change
    rename_column :contacts, :credit_cart, :credit_card
  end
end
