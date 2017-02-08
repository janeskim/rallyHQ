class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer   :bill_id
      t.boolean   :is_active
      t.datetime  :email_date
      t.datetime  :published_at
      t.datetime  :expires_at

      t.timestamps
    end
  end
end
