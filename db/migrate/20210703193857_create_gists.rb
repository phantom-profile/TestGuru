class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :url
      t.string :user
      t.timestamps
    end
  end
end
