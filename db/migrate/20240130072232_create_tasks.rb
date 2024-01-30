class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.string :status

      t.timestamps
    end
  end
end
