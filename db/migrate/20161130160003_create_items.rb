class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.boolean :lost, null: false
    	t.boolean :found, null: false
    	t.string :name, null: false
    	t.text :description
    	t.string :location
    	t.datetime :time
    	t.references :user, null: false
    t.timestamps
    end
  end
end
