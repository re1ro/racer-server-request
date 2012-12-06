PRIVATE_COLLECTION = require('./constants').PRIVATE_COLLECTION


modelPlugin = module.exports = (racer) ->
  racer.mixin(
    type: 'Model'

    decorate: (Model) ->
      Model.dataDescriptor
        name      : 'ServerRequest'
        normalize : (x)->x
        isInstance: (x)->x

        scopedResult: (model, descriptor)->
          model.at PRIVATE_COLLECTION + descriptor.ns

        registerFetch: (model, descriptor)->
          descriptor.ns

        subs: -> return []


    proto:
      serverRequest: (ns)->
        ns : ns,
        arg: Array(arguments).slice 1
  )
  return


modelPlugin.decorate = "racer"
modelPlugin.useWith =
  server : true
  browser: true

