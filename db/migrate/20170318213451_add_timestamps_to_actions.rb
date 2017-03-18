class AddTimestampsToActions < ActiveRecord::Migration
  def change
    add_column :actions, :created_at, :datetime
    add_column :actions, :updated_at, :datetime
  end
end
