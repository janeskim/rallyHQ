class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string  :title
      t.text    :body
      t.integer :campaign_id

      t.timestamps
    end
  end
end
