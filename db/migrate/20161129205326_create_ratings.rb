class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
    		t.integer :stars , null: false
    		t.references :user, null: false
    		t.integer :rater_id, null: false
      t.timestamps
    end
  end
end
