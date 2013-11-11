class AddConfirmationTokenToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :confirmation_token, :string
  end
end
