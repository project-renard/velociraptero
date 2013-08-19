app = app || {}

define [ "backbone" ], (Backbone) ->
  class app.ItemView extends Backbone.View
    tagName: 'li'
    className: 'item'
    template: _.template( $( '#item-template' ).html() ),

    render: ->
      $(@el).html @template(@model.toJSON())
      @