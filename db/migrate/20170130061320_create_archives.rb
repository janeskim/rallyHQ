class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.integer   :bill_id
      t.string    :senate_cloture_result
      t.date      :senate_cloture_result_at
      t.string    :senate_passage_result
      t.date      :senate_passage_result_at
      t.string    :senate_override_result
      t.date      :senate_override_result_at
      t.string    :house_passage_result
      t.date      :house_passage_result_at
      t.string    :house_override_result
      t.date      :house_override_result_at
      t.boolean   :vetoed
      t.date      :vetoed_at
      t.boolean   :active
      t.date      :active_at
      t.boolean   :awaiting_signature
      t.date      :awaiting_signature_since
      t.boolean   :enacted
      t.date      :enacted_at
    end
  end
end