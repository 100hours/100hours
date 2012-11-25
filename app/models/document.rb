class Document < ActiveRecord::Base

  def self.active
    order("updated_at DESC").first
  end

end
