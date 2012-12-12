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

  show: (doc) ->
    @hideAll()
    doc.set('selected', true)

  hideAll: ->
    @get('content').forEach (item) ->
      item.set('selected', null)

  # Computed properties ---------------------------------------

  # The currently selected/highlighted/clicked on document
  selectedDocument: (->
    @get('content').find (item) ->
      item.get('selected') == true
  ).property('@each.selected')

  # The active document is the most recent document
  activeDocument: (->
    @get('firstObject')
  ).property('firstObject')
