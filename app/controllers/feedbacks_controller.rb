class FeedbacksController < ApplicationController
  def show
    redirect_to action: "new"
  end

  def new
    # nothing to be done here
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_url, notice: "Thank you, your feedback has been recorded." }
      else
        format.html { render action: "new" }
      end
    end
  end
end
