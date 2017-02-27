class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :date
      t.string :location
      t.string :host
      t.references :member, foreign_key: true
      t.references :book, foreign_key: true
      t.references :club, foreign_key: true
    end
  end
end
