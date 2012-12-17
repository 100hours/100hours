class HowlersController < ApplicationController
  def howl
    howler = Howler.find_by_url(params[:id])
    if howler && howler.play!
      logger.warn "Howler #{howler.id} triggered!"
      Pusher.trigger(pusher_channel, 'howl', {})
      redirect_to root_url, notice: "Thank you for waking up David!"
    else
      redirect_to root_url, notice: "That token was not valid, sorry. You can earn your right to wake up David by <a href='http://www.justgiving.com/100hoursofsolitude'>donating at least $50 here</a>."
    end
  end

  private 
  def pusher_channel
    "#{Rails.env}_main_channel"
  end
end
