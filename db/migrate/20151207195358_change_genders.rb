class ChangeGenders < ActiveRecord::Migration
      def change
        remove_column :users, :looking_for_agender
        remove_column :users, :looking_for_bigender
        add_column :users, :looking_for_genderfluid, :boolean
        add_column :users, :looking_for_nonbinary, :boolean
    end   
end
