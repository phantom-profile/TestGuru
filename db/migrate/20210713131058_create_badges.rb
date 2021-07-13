class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_link, null: false, default: 'medal.png'
      t.boolean :unique, null: false, default: true
      t.timestamps
    end
  end
end
