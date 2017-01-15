class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :vote_id

      t.string :short_title
      t.string :api_id
      t.string :type
      t.string :number
      t.string :chamber
      t.string :result

      t.string :debate_chamber
      t.date :introduced_on
      t.date :last_action_at
      t.date :debate_at

      t.timestamps null: false
    end

    create_table :legislator_bills do |t|
      t.references :legislator, null: false
      t.references :bill, null: false
    end

    add_index :legislator_bills, [:legislator_id, :bill_id], unique: true

    create_table :committee_bills do |t|
      t.references :committee, null: false
      t.references :bill, null: false
    end

    add_index :committee_bills, [:committee_id, :bill_id], unique: true
  end
end
