HundredHours.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    goToIndex: Ember.Route.transitionTo('document.all')
    goToDocument: Ember.Route.transitionTo('document.show')

    document: Ember.Route.extend
      route: '/'
      connectOutlets: (router) -> 
        router.get('applicationController').connectOutlet
          outletName: 'documentsOutlet' 
          name: 'documents'
          context: HundredHours.store.findAll(HundredHours.Models.Document)

      index: Ember.Route.extend
        route: '/'
        redirectsTo: 'all'

      # These serve to manipulate the controller directly, instead of trying to handle outlets/views etc.  
      all: Ember.Route.extend
        route: '/all'
        connectOutlets: (router) ->
          router.get('documentsController').hideAll()

      show: Ember.Route.extend
        route: '/:document_id'
        serialize: (manager, doc) -> { "document_id": doc.get('id') }
        deserialize: (manager, params) -> HundredHours.Models.Document.find(params["document_id"])
        connectOutlets: (router, doc) -> 
          router.get('documentsController').show(doc)

          # Scroll window to the active document. Only really affects mobile
          el = $("#selected-document-view")
          if el.length > 0
            $('html, body').animate({
              scrollTop: el.offset().top - 20
            }, 100);

      