class CreateSchlafposts < ActiveRecord::Migration
  def change
    create_table :schlafposts do |t|
      t.integer :user_id
      t.string :title
      t.date :date
      t.time :anfang
      t.time :ende
      t.integer :stimmung
      t.text :dream
      t.text :description
      t.boolean :verpennt

      t.timestamps
    end
  end
end
