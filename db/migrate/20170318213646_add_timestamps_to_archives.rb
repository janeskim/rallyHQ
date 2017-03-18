class AddTimestampsToArchives < ActiveRecord::Migration
  def change
    add_column :archives, :created_at, :datetime
    add_column :archives, :updated_at, :datetime
  end
end
