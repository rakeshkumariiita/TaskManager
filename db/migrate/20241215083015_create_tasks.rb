class CreateTasks < ActiveRecord::Migration[8.0]
  def def(up)
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date

      t.timestamps
    end
    add_reference :tasks, :user, null: false, foreign_key: true
    add_reference :tasks, :status, null: false, foreign_key: true
    add_index :tasks, :user_id
  end
  def def(down)
    remove_index :tasks, name: :index_tasks_on_status_id
    remove_index :tasks, name: :index_tasks_on_user_id
    drop_table :tasks
  end
end
