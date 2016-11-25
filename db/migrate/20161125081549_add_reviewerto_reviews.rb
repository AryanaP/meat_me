class AddReviewertoReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :reviewer, :integer
  end
end
