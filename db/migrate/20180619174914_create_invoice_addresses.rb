class CreateInvoiceAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :house_number
      t.string :house_number_addition
      t.string :zip
      t.string :city
      t.string :country
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
