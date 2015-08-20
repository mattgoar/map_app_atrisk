class CreateDataStatuses < ActiveRecord::Migration
  def change
    create_table :data_statuses do |t|

      t.integer :last_edited_by

      t.integer :months_late

      t.integer :db_type

      t.integer :month

      t.integer :year

      t.integer :client_id


      t.timestamps

    end

  end
end
