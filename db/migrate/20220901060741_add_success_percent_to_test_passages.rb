class AddSuccessPercentToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :success_percent, :integer
  end
end
