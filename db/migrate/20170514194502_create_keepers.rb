class CreateKeepers < ActiveRecord::Migration
  def change
    create_table :keepers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
