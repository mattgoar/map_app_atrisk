class CreateImplStatuses < ActiveRecord::Migration
  def change
    create_table :impl_statuses do |t|
      t.boolean :active
      t.integer :last_edited_by
      t.string :status_name

      t.timestamps null: false
    end
  end
end
