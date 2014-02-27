class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :campaigns, :owner_id, :user_id
    rename_column :contributions, :backer_id, :user_id
  end
end
