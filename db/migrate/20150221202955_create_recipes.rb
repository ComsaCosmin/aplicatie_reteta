class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.integer :user_id
    	t.text :description
    	t.text :ingredient
    	t.text :direction
    	t.string :type
    	t.string :specific
    	t.integer :difficulty
    	t.string :title
      t.timestamps
    end
  end
end
