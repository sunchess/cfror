class CreateCfrorTexts < ActiveRecord::Migration
  def change
    create_table :cfror_texts do |t|
      t.integer :field_id
      t.index :field_id
      t.text :body
    end
  end
end
