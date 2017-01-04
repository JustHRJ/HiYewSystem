class AddPicturesToPictures < ActiveRecord::Migration
  def change
    add_column :images, :picture2, :string
    add_column :images, :picture3, :string
    add_column :images, :picture4, :string
    add_column :images, :picture5, :string
  end
end
