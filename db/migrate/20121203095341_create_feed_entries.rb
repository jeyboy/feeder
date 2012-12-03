class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :guid
      t.text :fields

      t.timestamps
    end
  end
end
