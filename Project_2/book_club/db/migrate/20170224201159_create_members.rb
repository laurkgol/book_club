class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :street_address
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :photo_url
      t.references :club, foreign_key: true
    end
  end
end
