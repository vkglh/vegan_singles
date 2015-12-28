class Reports < ActiveRecord::Migration
    def change
    create_table :reports do |t|
        t.integer :reporter_id
        t.integer :reported_id
        t.text :reason
        t.text :reported_message
        t.timestamps
    end
  end
end
