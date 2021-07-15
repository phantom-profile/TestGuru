class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.integer :rule_type
      t.integer :rule_attribute
      t.belongs_to :badge, foreign_key: true
      t.timestamps
    end
  end
end
