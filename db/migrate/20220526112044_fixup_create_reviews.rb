require_relative "20220526090856_create_reviews"

class FixupCreateReviews < ActiveRecord::Migration[7.0]
  def change
    revert CreateReviews

    create_table :reviews do |t|
      t.text :content
      t.float :rating
      t.references :giver, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
