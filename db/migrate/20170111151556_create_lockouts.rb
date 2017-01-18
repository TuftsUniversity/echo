class CreateLockouts < ActiveRecord::Migration[5.0]
  def change
    create_table :lockouts do |t|
      t.datetime :timestamp
      t.string :username
      t.string :host

      t.timestamps
    end
  end
end
