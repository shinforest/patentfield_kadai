class CreateSearchRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :search_records do |t|
      t.string :value, null: false
      t.timestamps
    end
  end
end
