class CreateCfrorFields < ActiveRecord::Migration
  def change
    create_table :cfror_fields do |t|
      t.string :field_type

      t.timestamps null: false
    end
  end
end
