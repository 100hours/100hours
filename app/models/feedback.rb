class Feedback < ActiveRecord::Base
  attr_accessible :subject, :body, :email
end
