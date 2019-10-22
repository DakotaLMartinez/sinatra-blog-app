class CreateComments < ActiveRecord::Migration 
  def change 
    create_table :comments do |t|
      t.string :title 
      t.text :content
      t.integer :post_id, foreign_key: true

      t.timestamps
    end
  end
end