class AddHobbitToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :hobbit, :boolean
  end
end
