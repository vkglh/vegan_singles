class AddFieldsToUsers < ActiveRecord::Migration
    def change
        change_column :users, :name, :string, :limit => 50
        change_column :users, :bio, :text, :limit => 5000
        add_column :users, :looking_for_agender, :boolean
        add_column :users, :facebook, :string
        add_column :users, :instagram, :string
        add_column :users, :skype, :string
  end   
end
