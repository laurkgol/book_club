class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :photo_url
      t.string :description
      t.string :link
      t.string :genre
      t.string :rating
      t.references :club, foreign_key: true
      t.references :meeting, foreign_key: true
    end
  end
end
