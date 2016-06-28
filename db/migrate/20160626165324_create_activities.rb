class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :teacher
      t.references :room

      t.string :title
      t.text :description
      t.string :activity_type
      t.integer :vacancies

      t.timestamps
    end
  end
end
