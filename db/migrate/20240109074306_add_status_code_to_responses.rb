class AddStatusCodeToResponses < ActiveRecord::Migration[7.1]
  def change
    add_column :responses, :status_code, :integer
  end
end
