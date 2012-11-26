class Document < ActiveRecord::Base
  attr_accessible :body, :title

  extend FriendlyId
  friendly_id :title, :use => :slugged

  def self.active
    order("updated_at DESC").first
  end

end
