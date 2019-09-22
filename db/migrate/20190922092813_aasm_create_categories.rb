class AasmCreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table(:categories) do |t|
      t.string :name
      t.belongs_to :vertical, null: false, foreign_key: true
      t.string :state
      t.timestamps null: false 
    end
  end
end
