class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, validates: true
      t.string :last_name, validates: true
      t.string :email, validates: true
      t.text :description, validates: true

      t.timestamps




    end
  end
end
