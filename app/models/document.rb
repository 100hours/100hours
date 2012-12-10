class Document < ActiveRecord::Base
  attr_accessible :body, :title

  default_scope order("updated_at DESC")

  def self.active
    self.first
  end

end
