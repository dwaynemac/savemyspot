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
  
  permit_params :room_id,
                :teacher_id,
                :vacancies,
                :title,
                :activity_type,
                :description,
                :timeslot_id,
                :poster

  index do
    column :timeslot
    column :room
    column :title
    column :activity_type
    column :vacancies
    actions
  end

  show do
    attributes_table do
      row :teacher
      row :room
      row :timeslot
      row :activity_type
      row :vacancies
      row :poster do
        image_tag resource.poster.url
      end
    end
  end

  form html: { multipart: true } do |f|
    f.semantic_errors
    f.inputs do
      f.input :teacher
      f.input :room
      f.input :timeslot
      f.input :title
      f.input :activity_type
      f.input :vacancies
      f.input :poster, as: :file
    end
    f.actions
  end

end
