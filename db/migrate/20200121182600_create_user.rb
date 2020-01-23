class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.boolean :admin, default: false
      t.string :discriminator
    end
  end
end