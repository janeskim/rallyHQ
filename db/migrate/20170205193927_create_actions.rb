class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :legislator_id
      t.integer :checklist_id
      t.string  :category
    end
  end
end
