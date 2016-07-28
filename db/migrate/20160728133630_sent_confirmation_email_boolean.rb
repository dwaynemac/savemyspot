class SentConfirmationEmailBoolean < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sent_confirmation_email, :boolean
  end
end
