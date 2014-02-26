class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :breakpoint_id

      t.timestamps
    end
  end
end
