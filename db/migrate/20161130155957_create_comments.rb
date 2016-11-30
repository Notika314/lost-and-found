class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.text :body, null: false
    	t.references :user, null: false
    	t.references :item, null: false
    	t.integer :parent_id
    t.timestamps 
    end
  end
end
