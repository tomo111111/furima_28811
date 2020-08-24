class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefectute,    null: false
      t.string     :city,          null: false
      t.string     :house_number,  null: false
      t.string     :building_name, null: false
      t.string     :phone_number,  null: false
      t.references :contract,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
