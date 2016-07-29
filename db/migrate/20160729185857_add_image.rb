class AddImage < ActiveRecord::Migration[5.0]
  def up
    add_attachment :activities, :poster
  end

  def down
    remove_attachment :activities, :poster
  end
end
