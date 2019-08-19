class CreateMonuments < ActiveRecord::Migration[5.2]
  def change
    create_table :monuments do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :address
      t.string :qrcode
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
