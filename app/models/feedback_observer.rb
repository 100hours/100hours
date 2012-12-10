class FeedbackObserver < ActiveRecord::Observer
  def after_create(feedback)
    HundredHours::Application.config.notify_list.each do |address|
      Notifier.feedback(address, feedback).deliver
    end
  end
end
