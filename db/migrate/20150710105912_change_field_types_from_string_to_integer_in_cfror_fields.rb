class ChangeFieldTypesFromStringToIntegerInCfrorFields < ActiveRecord::Migration
  def change
    change_column :cfror_fields, :field_type, :integer #'integer USING CAST(field_types AS integer)'
  end
end
