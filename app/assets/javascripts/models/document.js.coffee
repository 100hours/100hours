HundredHours.Models.Document = DS.Model.extend
  title: DS.attr('string')
  body: DS.attr('string')
  updated_at: DS.attr('date')
  isVisible: true

HundredHours.Models.Document.reopenClass
  collectionUrl: 'documents'
  url: 'document'
