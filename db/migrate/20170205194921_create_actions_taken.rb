class CreateActionsTaken < ActiveRecord::Migration
  def change
    create_table :actions_takens do |t|
      t.integer :user_id
      t.integer :action_id
      t.integer :campaign_id
    end
  end
end
