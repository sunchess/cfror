class CreateCfrorBooleans < ActiveRecord::Migration
  def change
    create_table :cfror_booleans do |t|
      t.integer :field_id
      t.index :field_id

      t.string :dataable_type
      t.index :dataable_type

      t.integer :dataable_id
      t.index :dataable_id

      t.index [:dataable_type, :dataable_id]

      t.boolean :body
    end
  end
end
