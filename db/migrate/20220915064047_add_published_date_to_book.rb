class AddPublishedDateToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :published_date, :date
  end
end
