class Document < ActiveRecord::Base
  attr_accessible :body, :title
  def self.active
    order("updated_at DESC").first
  end

end
