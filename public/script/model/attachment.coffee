# cs!app/model/attachment
app = app || {}
define [ "backbone" ], (Backbone) ->
  class app.Attachment extends Backbone.Model
    defaults:
      itemid: ''
      mimetype: ''
      attachmentid: ''
      item_attachment_file_url: ''

    sync: ->
      # NOP: we'll have no syncing here