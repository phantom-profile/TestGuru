class TestsUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests
  end
end
