class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.string :name
      t.string :email
      t.string :organization
      t.text :message

      t.timestamps null: false
    end
  end
end
