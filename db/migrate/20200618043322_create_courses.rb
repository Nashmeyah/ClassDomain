class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :category_id
      t.integer :user_id
    end
  end
end
