class RemoveResultInBills < ActiveRecord::Migration
  def change
    remove_column :bills, :result
  end
end
