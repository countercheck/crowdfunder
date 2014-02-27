class AddBackerIdToContributions < ActiveRecord::Migration
  def change
  	add_column :contributions, :backer_id, :Integer
  end
end
