HundredHours.Models.Document = DS.Model.extend
  title: DS.attr('string')
  body: DS.attr('string')

HundredHours.Models.Document.reopenClass
  collectionUrl: 'documents'
  url: 'document'