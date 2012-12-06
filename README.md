Server Request for [racer](https://github.com/codeparty/racer)
====================

Request data from racer server. Can be used with [racer](https://github.com/codeparty/racer) or [derby](https://github.com/codeparty/derby)

# Install

```sh
$ npm i racer-server-request
```

# Using

You need to connect plugin for `Store` and `Model`. 
You will get `store.serverRequest.register` and `model.serverRequest` methods.

### Warning!
`model.serverRequest` can be used only with `model.fetch`.

## `server/index.js` example

```javascript
var derby = require('derby');

derby.use(require('racer-server-request').storePlugin());

store = derby.createStore({
  listen: server
});

/*
 * You have `this.session` and `this.done()` context
 */
store.serverRequest.register('tumblrInfo', function(param1, param2) {
  var done = this.done;
  
  if (this.session.name === param1)
    tumblr.get('/user/info', function(err, data) {
      done(err, data);
    });
  else
    done('Access denied', null);
});
```


## `app/index.js` example

```javascript
var derby = require('derby');

derby.use(require('racer-server-request').modelPlugin());

var app = derby.createApp(module);

app.get('/', function(page, model, params, next) {
  var serverRequest = model.serverRequest('tumblrInfo', 'param1', 'param2');
  
  model.fetch(serverRequest, function(err, scopedInfo) {
    model.ref('_tumblrInfo', scopedInfo);
    page.render();
  });
});

```

# Developing

You need to install grunt globally:
```sh
$ npm i -g grunt
```

* Compile coffee:

```sh
$ grunt
```

* Watch coffee:

```sh
$ grunt run
```

