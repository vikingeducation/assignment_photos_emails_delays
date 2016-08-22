class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.binary :data, :limit => 10.megabytes
      t.string :filename
      t.string :mime_type
      t.timestamps
    end
  end
end
