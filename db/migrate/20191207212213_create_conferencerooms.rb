class CreateConferencerooms < ActiveRecord::Migration[5.2]
  def change
    create_table :conferencerooms do |t|
      t.string :conferenceroomname, null: false
      t.integer :people, null: false
      t.integer :price, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.text :remarks
      t.references :facility, foreign_key: true, null: false

      
      t.timestamps
    end
  end
end
