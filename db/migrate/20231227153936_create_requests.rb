class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :url
      t.string :method
      t.json :body
      t.json :authorization
      t.json :headers
      t.json :parameters
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
