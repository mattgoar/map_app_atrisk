class CreateClientInformations < ActiveRecord::Migration
  def change
    create_table :client_informations do |t|

      t.integer :client_id

      t.integer :last_edited_by

      t.date :last_contact_date

      t.string :exec_sponsor

      t.date :termination_notice

      t.integer :payment_status_id

      t.integer :balance

      t.date :reactivation_date

      t.date :expiration_date

      t.integer :annual_fee

      t.integer :sales_rep_id

      t.string; :type


      t.timestamps

    end

  end
end
