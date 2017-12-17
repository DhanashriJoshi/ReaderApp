class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :description
      t.integer :feed_id
      t.datetime :published_at
      t.string :title
      t.string :url
      t.string :author
      t.string :article_no

      t.timestamps null: false
    end
  end
end
