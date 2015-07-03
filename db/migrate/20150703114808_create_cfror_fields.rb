class CreateCfrorFields < ActiveRecord::Migration
  def change
    create_table :cfror_fields do |t|
      t.string :fieldable_type
      t.index :fieldable_type
      t.integer :fieldable_id
      t.index :fieldable_id
      t.index [:fieldable_type, :fieldable_id]

      t.string :field_type
      t.string :title
      t.string :name
    end
  end
end
