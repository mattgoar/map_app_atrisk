class CreateSalesReps < ActiveRecord::Migration
  def change
    create_table :sales_reps do |t|

      t.boolean :active

      t.integer :last_edited_by

      t.string :name


      t.timestamps

    end

  end
end
