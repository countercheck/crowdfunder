class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.integer :target_in_cents
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
