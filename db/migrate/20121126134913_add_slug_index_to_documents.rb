class AddSlugIndexToDocuments < ActiveRecord::Migration
  def change
    add_index :documents, :slug, unique: true
  end
end
