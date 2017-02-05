class CreateChecklist < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.integer :campaign_id
      t.string :title

      t.timestamps
    end
  end
end
