ActiveAdmin.register Activity do

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
  
  permit_params :room_id, :teacher_id, :vacancies, :title, :activity_type, :description, :timeslot_id

  index do
    column :timeslot
    column :room
    column :title
    column :activity_type
    column :vacancies
    actions
  end

end
