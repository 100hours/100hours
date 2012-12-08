class Document < ActiveRecord::Base
  attr_accessible :body, :title

  default_scope order("updated_at DESC")

  # # extend FriendlyId
  # friendly_id :title, :use => :slugged

  def self.active
    self.first
  end

end
