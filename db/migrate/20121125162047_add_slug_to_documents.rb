class AddSlugToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :slug, :string
  end
end
