class Addreportviewed < ActiveRecord::Migration
  def change
    add_column :reports, :reviewed, :boolean
  end
end
