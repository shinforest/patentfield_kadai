class CreateSearchAssignee1s < ActiveRecord::Migration[5.1]
  def change
    create_table :search_assignee1s do |t|
      t.string :value

      t.timestamps
    end
  end
end
