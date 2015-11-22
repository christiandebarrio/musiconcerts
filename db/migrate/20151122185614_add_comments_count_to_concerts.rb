class AddCommentsCountToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :comments_count, :integer
  end
end
