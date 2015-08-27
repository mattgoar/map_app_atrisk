class CreateAtrisks < ActiveRecord::Migration
  def change
    create_table :atrisks do |t|
      t.integer :month
      t.integer :year
      t.integer :client_id
      t.string :exec_sponsor_status
      t.string :last_contact_status
      t.string :payment_status
      t.string :data_status
      t.string :implementation_status
      t.string :current_status
      t.string :current_reason

      t.timestamps null: false
    end
  end
end
