class CreateClientOnboardingStatuses < ActiveRecord::Migration
  def change
    create_table :client_onboarding_statuses do |t|

      t.integer :last_edited_by

      t.text :notes

      t.integer :current_impl_status

      t.date :certification_date

      t.date :kickoff_date

      t.integer :client_id


      t.timestamps

    end

  end
end
