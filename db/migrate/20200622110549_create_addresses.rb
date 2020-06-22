class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :postcode
      t.string :plus_code
      t.float :latitude
      t.float :longitude
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
