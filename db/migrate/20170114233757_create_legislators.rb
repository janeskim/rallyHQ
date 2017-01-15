class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :first_name
      t.string :last_name
      t.string :party
      t.string :title
      t.string :state
      t.string :chamber
      t.string :phone
      t.string :website
      t.string :address
      t.string :bioguide_id
      t.string :govtrack_id
      t.string :thomas_id
      t.boolean :in_office
      t.datetime :term_start
      t.datetime :term_end

      t.timestamps null: false
    end
  end
end
