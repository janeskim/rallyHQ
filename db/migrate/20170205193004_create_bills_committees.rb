class CreateBillsCommittees < ActiveRecord::Migration
  def change
    create_table :bills_committees do |t|
      t.references :bill, null: false
      t.references :committee, null: false
    end

    add_index :bills_committees, [:bill_id, :committee_id], unique: true
    drop_table :committee_bills
  end
end
