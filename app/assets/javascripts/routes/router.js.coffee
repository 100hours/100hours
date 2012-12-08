HundredHours.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    goToIndex: Ember.Route.transitionTo('document.index')
    goToDocument: Ember.Route.transitionTo('document.show')

    document: Ember.Route.extend
      route: '/'
      connectOutlets: (router) -> 
        router.get('applicationController').connectOutlet
          outletName: 'documentsOutlet' 
          name: 'documents'
          context: HundredHours.store.findAll(HundredHours.Models.Document)

      # These serve to manipulate the controller directly, instead of trying to handle outlets/views etc.  
      index: Ember.Route.extend
        route: '/'
        connectOutlets: (router) ->
          router.get('documentsController').hideAll()

      show: Ember.Route.extend
        route: '/:document_id'
        serialize: (manager, doc) -> { "document_id": doc.get('id') }
        deserialize: (manager, params) -> HundredHours.Models.Document.find(params["document_id"])
        connectOutlets: (router, doc) -> 
          router.get('documentsController').show(doc)

      