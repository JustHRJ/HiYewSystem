class AddProjectCompleteToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_complete, :boolean, default: false
  end
end
