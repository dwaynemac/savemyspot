class AddSentSatisfactionSurverBoolean < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sent_satisfaction_survey, :boolean
  end
end
