class AddOwnerToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :owner_id, :integer
  end
end
