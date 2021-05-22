class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :user 
      t.references :bank
      t.float      :balance
      t.string :account_number
      t.string :routing_number
      t.timestamps
    end
  end
end
