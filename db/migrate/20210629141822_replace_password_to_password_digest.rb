class ReplacePasswordToPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
    change_column_default :users, :role, 0
  end
end
