class CreatePosts < ActiveRecord::Migration
  def change
    # TODO: your code here to create the posts table
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
