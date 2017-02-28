class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.references :user, foreign_key: true
    end
  end
end
