HundredHours.DocumentsController = Ember.ArrayController.extend

  sortProperties: ['updated_at']
  sortAscending: false

  init: ->
    # Setup Pusher
    pusher = new Pusher('8146487894a3cc81758c')
    @set('pusher', pusher)
    channel = pusher.subscribe('main_channel')
    channel.bind 'update', (payload) =>
      # TODO: Clean up this big ugly chunk of procedural code
      doc = @content.find((item) => item.get('id') == payload.id)
      if doc
        doc.setProperties
          title: payload.title
          body: payload.body
          updated_at: new Date(payload.updated_at)
      else
        doc = HundredHours.Models.Document.createRecord(payload)
      # Whatever happens, set the active document to be this update
      @set('activeDocumentId', payload.id)


  activeDocumentId: "1" # TODO: Don't assume that the first document has an ID of 1

  show: (doc) ->
    @hideAll()
    doc.set('active', true)

  hideAll: ->
    @get('content').forEach (item) ->
      item.set('active', null)

  # Computed properties ---------------------------------------

  # The currently selected/highlighted/clicked on document
  selectedDocument: (->
    @get('content').find (item) ->
      item.get('active') == true
  ).property('content.@each.active')

  # The document being worked on by David
  activeDocument: (->
    @get('content').find (item) =>
      item.get('id') == @get('activeDocumentId')
  ).property('activeDocumentId', 'content.length')

  # Is the user viewing the same document that david is working on?
  viewingActiveDocument: (->
    !@get('selectedDocument.id')
  ).property('selectedDocument', 'activeDocument')
