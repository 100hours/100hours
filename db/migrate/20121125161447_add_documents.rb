class AddDocuments < ActiveRecord::Migration
  def up
    create_table :documents do |t|
      t.string :title
      t.text   :body
      t.integer :version
      t.timestamps
    end
  end

  def down
    drop_table :documents
  end
end
