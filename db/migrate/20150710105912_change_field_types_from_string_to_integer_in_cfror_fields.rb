class ChangeFieldTypesFromStringToIntegerInCfrorFields < ActiveRecord::Migration
  def up 
    remove_column :cfror_fields, :field_type
    add_column :cfror_fields, :field_type, :integer
  end

  def down
    remove_column :cfror_fields, :field_type
    add_column :cfror_fields, :field_type, :string
  end
end
