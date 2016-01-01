class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_eng, null: false
      t.string :given_name_eng, null: false
      t.string :staff_user_name, null: false
      t.string :staff_user_name_index, null: false
      t.string :hashed_password, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :suspended, null: false, default: false

      t.timestamps
    end
    add_index :staff_members, :email_for_index, unique: true
    add_index :staff_members, [:family_name_eng, :given_name_eng]
    add_index :staff_members, :staff_user_name_index
  end
end
