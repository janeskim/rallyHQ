class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :api_id
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
