class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references  :user,             null: false, foreign_key: true
      t.references  :spot,             null: false, foreign_key: true
      t.integer     :category_id,      null:false
      t.string      :event_title,      null:false
      t.text        :event_detail,     null: false
      t.datetime    :start_time,       null: false
      t.datetime    :end_time,         null: false
    
      t.timestamps
    end
  end
end
