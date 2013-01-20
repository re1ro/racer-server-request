PRIVATE_COLLECTION = require('./constants').PRIVATE_COLLECTION


storePlugin = module.exports = (racer) ->
  racer.mixin(
    type: "Store"
    events:
      init: (store) ->
        store.serverRequest =
          _handlers:
            {}
          register: (type, cb)->
            @_handlers[type] = cb

        return


      middleware: (store, middleware, createMiddleware) ->
        middleware.fetchServerRequest = createMiddleware()

        middleware.fetchServerRequest.add (req, res, next) ->
          target = req.target
          ns = target.ns

          unless handler = store.serverRequest._handlers[ns]
            return console.error "Could not find handler for `#{ns}` request"

          handler.apply(
            session: req.session
            done: (err, data)->
              return res.fail err if err

              res.send [
                [PRIVATE_COLLECTION + ns, data]
              ]
              next()
              return
          ,
          target.arg
          )
          return

        return


    decorate: (Store) ->
      Store.dataDescriptor
        name: 'ServerRequest'
        normalize: (x)->x
        isInstance: (x)->x
      return
  )


storePlugin.decorate = "racer"
storePlugin.useWith =
  server: true
  browser: false