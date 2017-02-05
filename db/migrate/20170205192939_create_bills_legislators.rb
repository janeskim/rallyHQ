class CreateBillsLegislators < ActiveRecord::Migration
  def change
    create_table :bills_legislators do |t|
      t.references :bill, null: false
      t.references :legislator, null: false
    end

    add_index :bills_legislators, [:bill_id, :legislator_id], unique: true
    drop_table :legislator_bills
  end
end
