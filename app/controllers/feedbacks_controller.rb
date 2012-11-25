class FeedbacksController < ApplicationController
  def show
    redirect_to action: "new"
  end

  def new
    # nothing to be done here
  end

  def create
    Feedback.create(params[:feedback])
    redirect_to root_url, notice: "Thank you, your feedback has been recorded."
  end
end
