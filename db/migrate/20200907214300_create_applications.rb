class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.text :description
      t.string :github_link
      t.integer :dev_id

      t.timestamps null: false
    end
  end
end
