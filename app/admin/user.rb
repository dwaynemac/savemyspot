ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :email, :name, :sent_confirmation_email, :sent_first_login_link, :sent_satisfaction_survey

  active_admin_import

  index do
    selectable_column
    column :name
    column :email
    column :sent_first_login_link
    column :sent_confirmation_email
    column :sent_satisfaction_survey
    column :sign_in_count
    actions
  end

  form do |f|
    inputs do
      input :name
      input :email
      input :sent_confirmation_email
      input :sent_first_login_link
      input :sent_satisfaction_survey
    end
    actions
  end

  batch_action :send_login_link do |ids|
    batch_action_collection.find(ids).each do |user|
      TokenMailer.login_link(user).deliver_now
    end
    redirect_to collection_path, alert: "Links have been delivered"
  end

  batch_action :send_first_login_email do |ids|
    batch_action_collection.find(ids).each do |user|
      TokenMailer.first_login(user).deliver_now
      user.update_attribute(:sent_first_login_link, true)
    end
    redirect_to collection_path, alert: "Links have been delivered"
  end

  batch_action :send_satisfaction_survey do |ids|
    batch_action_collection.find(ids).each do |user|
      TransactionalMailer.satisfaction_survey(user).deliver_now
      user.update_attribute(:sent_satisfaction_survey, true)
    end
    redirect_to collection_path, alert: "Links have been delivered"
  end


end
