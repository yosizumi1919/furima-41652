class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string   :address_number, null: false
      t.integer  :region_id, null: false
      t.string   :city,null: false
      t.string   :street, null: false
      t.string   :building
      t.string   :phone_number, null: false
      t.references  :order, null: false, foreign_key: true
    

      t.timestamps
    end
  end
end
