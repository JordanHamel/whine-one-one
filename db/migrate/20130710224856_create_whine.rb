class CreateWhine < ActiveRecord::Migration
  def change
    create_table :whines do |t|
      t.text :message

      t.timestamps
    end
  end
end
