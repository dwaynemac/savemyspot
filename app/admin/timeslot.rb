ActiveAdmin.register Timeslot do

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

  permit_params :start_at, :end_at

  index do
    column :start_at do |t|
      t.start_at.to_formatted_s(:time)
    end
    column :end_at do |t|
      t.end_at.to_formatted_s(:time)
    end
    actions
  end

end
