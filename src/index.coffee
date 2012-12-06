# tricking brouserify
_require = require

module.exports =
  modelPlugin: ()-> require './Model'
  storePlugin: ()-> _require './Store'