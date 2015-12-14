class Removetitledesc < ActiveRecord::Migration

  def change
    remove_column :users, :gallery_title_1
    remove_column :users, :gallery_title_2
    remove_column :users, :gallery_title_3
    remove_column :users, :gallery_title_4

    remove_column :users, :gallery_desc_1
    remove_column :users, :gallery_desc_2
    remove_column :users, :gallery_desc_3
    remove_column :users, :gallery_desc_4
  end

end
