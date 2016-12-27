class CreateProjectLogs < ActiveRecord::Migration
  def change
    create_table :project_logs do |t|
      t.timestamps
      t.text :details
      t.string :heading
      t.integer :project_id
    end
  end
end
