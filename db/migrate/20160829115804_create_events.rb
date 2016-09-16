class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :eventname
      t.date :date
      t.text :time
      t.text :venue
      t.text :description

      t.timestamps
    end
  end
end
