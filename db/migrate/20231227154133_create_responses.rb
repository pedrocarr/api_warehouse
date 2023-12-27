class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :request, null: false, foreign_key: true
      t.json :body

      t.timestamps
    end
  end
end
