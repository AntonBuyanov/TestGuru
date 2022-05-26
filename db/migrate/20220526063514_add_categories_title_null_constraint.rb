class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[6.1]
  # def change
  # end

  def up
    change_column_null(:categories, :title, false)
  end

  def down
    change_column_null(:categories, :title, true)
  end
end
