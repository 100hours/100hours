class Howler < ActiveRecord::Base
  def play!
    return false unless self.charges && self.charges > 0
    self.charges -= 1
    self.played_at = Time.now
    self.save
  end
end
