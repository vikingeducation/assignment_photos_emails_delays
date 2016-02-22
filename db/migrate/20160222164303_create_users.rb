class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.binary :data, :limit => 10.megabytes
      t.string :mime_type
      t.string :filename

      t.timestamps null: false
    end
  end
end
