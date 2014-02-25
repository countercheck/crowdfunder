class AddFundsRaisedInCentsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :funds_raised_in_cents, :Integer
  end
end
