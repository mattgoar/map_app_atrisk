class CreatePaymentStatuses < ActiveRecord::Migration
  def change
    create_table :payment_statuses do |t|

      t.boolean :active

      t.integer :last_edited_by

      t.string; :status_name


      t.timestamps

    end

  end
end