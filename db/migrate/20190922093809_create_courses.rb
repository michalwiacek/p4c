class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :state
      t.string :name, null: false
      t.belongs_to :author, null: false, foreign_key: true 
      t.belongs_to :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
