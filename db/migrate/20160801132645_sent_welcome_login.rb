class SentWelcomeLogin < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sent_first_login_link, :boolean
  end
end
