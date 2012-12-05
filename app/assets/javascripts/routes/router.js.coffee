HundredHours.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    goToDocument: Ember.Route.transitionTo('document.show')

    document: Ember.Route.extend
      route: '/'
      enter: ->
        console.log 'document'

      connectOutlets: (router) -> 
        router.get('applicationController').connectOutlet
          outletName: 'documentsOutlet' 
          name: 'documents'
          context: HundredHours.store.findAll(HundredHours.Models.Document)

      index: Ember.Route.extend
        route: '/'
        enter: ->
          console.log 'document index'

      show: Ember.Route.extend
        route: '/:document_id'
        enter: ->
          console.log 'document show'
        serialize: (manager, doc) ->
          { "document_id": doc.get('id') }
        deserialize: (manager, params) ->
          HundredHours.Models.Document.find(params["document_id"])

        connectOutlets: (router, doc) -> 
          doc.set('active', true)
          router.get('applicationController').connectOutlet
            outletName: 'documentOutlet' 
            name: 'document'
            context: doc

      