class AddCustomerNumberToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :customer_number, :string
  end
end
