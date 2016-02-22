class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.binary :data, :limit => 10.megabytes, null: false
      t.string :mime_type, null: false
      t.string :filename, null: false

      t.timestamps null: false
    end
  end
end
