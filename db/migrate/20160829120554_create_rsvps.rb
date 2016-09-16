class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.boolean :status
      t.string :name
      t.text :message
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
