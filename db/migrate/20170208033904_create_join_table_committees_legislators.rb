class CreateJoinTableCommitteesLegislators < ActiveRecord::Migration
  def change
    create_join_table :committees, :legislators, id: false, force: true do |t|
      t.index :committee_id
      t.index :legislator_id
    end
  end
end
