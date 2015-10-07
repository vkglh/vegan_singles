class AddFieldstoUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => 'Member'
    add_column :users, :name, :string, :limit => 30
	add_column :users, :bio, :text, :limit => 1000
	add_column :users, :date_of_birth, :datetime
	add_column :users, :city, :string
	add_column :users, :gender, :string
	add_column :users, :looking_for_male, :boolean
	add_column :users, :looking_for_female, :boolean
	add_column :users, :looking_for_bigender, :boolean
  end							
end
