class Addbookstomeeting < ActiveRecord::Migration[5.0]
  def change
    add_reference(:meetings, :book)

  end
end
