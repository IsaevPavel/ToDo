class Todo < ActiveRecord::Migration
  def up
    create_table :todos do |t|
      t.column :name, :string
      t.column :done, :boolean
    end


  end

  def down
    drop_table :todos
  end
end
