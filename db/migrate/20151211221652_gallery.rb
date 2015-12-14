class Gallery < ActiveRecord::Migration
  def change
    add_column :users, :gallery_img_1, :string
    add_column :users, :gallery_img_2, :string
    add_column :users, :gallery_img_3, :string
    add_column :users, :gallery_img_4, :string

    add_column :users, :gallery_title_1, :string, :limit => 20
    add_column :users, :gallery_title_2, :string, :limit => 20
    add_column :users, :gallery_title_3, :string, :limit => 20
    add_column :users, :gallery_title_4, :string, :limit => 20

    add_column :users, :gallery_desc_1, :string, :limit => 200
    add_column :users, :gallery_desc_2, :string, :limit => 200
    add_column :users, :gallery_desc_3, :string, :limit => 200
    add_column :users, :gallery_desc_4, :string, :limit => 200
  end
end
