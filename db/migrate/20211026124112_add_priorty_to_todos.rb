class AddPriortyToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :priorty, :integer
  end
end
