class CreateInvalidRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :invalid_records do |t|
      t.string :name
      t.string :date_of_birth
      t.string :phone
      t.string :adress
      t.string :credit_card
      t.string :franchise
      t.string :email
      t.string :error_message
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
