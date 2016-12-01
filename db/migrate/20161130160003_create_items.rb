class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.string :status, null: false
    	t.string :name, null: false
    	t.text :description
    	t.string :location
    	t.date :date
    	t.references :user, null: false
    t.timestamps
    end
  end
end
