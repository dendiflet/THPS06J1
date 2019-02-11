class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, validates: true
      t.text :description, validates: true
      t.datetime :start_date, validates: true
      t.integer :duration, validates: true
      t.integer :price, validates: true
      t.string :location, validates: true
      t.belongs_to :admin, index: true


      t.timestamps
    end
  end
end
