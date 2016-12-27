class AddCompletedTimeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :completed_time, :datetime
  end
end
