ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  action_item :clear_cache do
    link_to 'clear cache', clear_cache_admin_activities_path
  end

  content title: proc{ I18n.t("active_admin.dashboard") } do

    Room.all.each do |room|
      panel room.name do
        table_for room.activities do
          column :timeslot
          column :title
          column :teacher
          column :vacancies
          column :available_vacancies
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
