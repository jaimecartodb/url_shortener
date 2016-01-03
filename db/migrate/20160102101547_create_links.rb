class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.string :original_url
    	t.string :new_url
    	t.integer :visits
    	t.date :last_visit
      t.timestamps null: false
    end
  end
end
