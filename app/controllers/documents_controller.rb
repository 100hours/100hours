class DocumentsController < ApplicationController

  respond_to :html, :json

  def index
    @documents = Document.all
    respond_with @documents
  end

  def show
    @document = Document.find(params[:id])
  end
end
