class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :action_id
      t.integer :user_id

      t.timestamps
    end
  end
end
