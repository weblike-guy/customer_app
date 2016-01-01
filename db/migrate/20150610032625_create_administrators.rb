class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :admin_name, null: false
      t.string :hashed_password, null: false
      t.date   :start_date, null: false
      t.date   :end_date
      t.boolean :suspended, null:false, default: false

      t.timestamps
    end
    add_index :administrators, :email_for_index, unique: true
    add_index :administrators, :admin_name
  end
end
