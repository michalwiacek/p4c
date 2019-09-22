class AasmCreateVerticals < ActiveRecord::Migration[6.0]
  def change
    create_table(:verticals) do |t|
      t.string :name
      t.string :state
      t.timestamps null: false 
    end
  end
end
