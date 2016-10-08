class SuperUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :super_users do |t|
      t.string :name
      t.timestamps
    end
  end
end
