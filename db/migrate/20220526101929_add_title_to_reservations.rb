class AddTitleToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :title, :string
  end
end
