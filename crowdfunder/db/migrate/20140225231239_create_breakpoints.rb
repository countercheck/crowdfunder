class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.string :title
      t.text :description
      t.datetime :estimated_delivery
      t.integer :value_in_cents
      t.integer :number_available
      t.integer :campaign_id

      t.timestamps
    end
  end
end
