module HundredHours
  class API < Grape::API
    prefix "api"
    format :json
    version "v1", :using => :param, :parameter => "v"

    helpers do
      def auth_required?
        !ENV["HTTP_AUTH_TOKEN"].nil?
      end

      def authenticated_request?
        ENV["HTTP_AUTH_TOKEN"] == env["HTTP_X_AUTHTOKEN"]
      end
      
      def authenticate!
        return unless auth_required? 
        error!('401 Unauthorized', 401) unless authenticated_request?
      end
    end

    resource "documents" do
      desc "get a list of available documents"
      get do
        Document.all
      end

      desc "get the current version of a specific document"
      params do
        requires :id, :type => Integer, :desc => "Document ID"
      end
      get ':id' do
        Document.find(params[:id])
      end

      desc "create a new document"
      params do
        optional :title, :type => String, :desc => "Document title"
        optional :body, :type => String, :desc => "Document body"
      end
      post do
        authenticate!
        Document.create(title: params[:title], body: params[:body])
      end

      desc "update a document"
      params do
        requires :title, :type => String, :desc => "Document title"
        requires :body, :type => String, :desc => "Document body"
        requires :id, :type => Integer, :desc => "Document ID"
      end
      put ':id' do
        authenticate!
        Document.find(params[:id]).
          update_attributes(title: params[:title], body: params[:body])
      end
    end
  end
end
