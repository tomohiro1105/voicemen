class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :keyword, null: false
      t.text :content_url, null: false

      t.timestamps
    end
  end
end
