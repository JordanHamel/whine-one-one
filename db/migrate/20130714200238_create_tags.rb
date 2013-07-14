class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text

      t.timestamps
    end

    create_table :whine_tags do |t|
      t.integer :whine_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
