class AddNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)

    change_column_null(:categories, :title, false)

    change_column_null(:questions, :body, false)

    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)

    change_column_null(:users, :username, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :firstname, false)
    change_column_null(:users, :role, false)
  end
end
