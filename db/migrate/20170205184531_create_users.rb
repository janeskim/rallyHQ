class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, null: false, default: ""
      t.string  :email, null: false, default: ""
      t.string  :password_digest, null: false, default: ""
      t.string  :state
      t.string  :zipcode
      t.boolean :is_active
      t.boolean :is_admin
      t.datetime :last_login

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
