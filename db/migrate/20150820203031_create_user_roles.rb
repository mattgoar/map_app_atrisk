class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|

      t.text :role_description

      t.string :role_name


      t.timestamps

    end

  end
end
