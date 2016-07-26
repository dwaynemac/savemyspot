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

  permit_params :email, :name

  active_admin_import

  index do
    selectable_column
    column :name
    column :email
    actions
  end

  form do |f|
    inputs do
      input :name
      input :email
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
    end
    redirect_to collection_path, alert: "Links have been delivered"
  end


end
