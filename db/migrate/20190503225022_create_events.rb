class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :name
      t.date :event_date

      t.timestamps
    end
  end
end
