class HomeController < ApplicationController
  def index
    @documents = Document.select("id, title, updated_at")
    @document  = Document.active
  end
end
