class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.references  :user,             null: false, foreign_key: true
      t.string      :spot_name,        null:false
      t.integer     :area_id,          null:false
      t.string      :postal_code,      null: false
      t.string      :address,          null: false
      t.string      :building
      t.string      :phone_number,     null: false     

      t.timestamps
    end
  end
end
