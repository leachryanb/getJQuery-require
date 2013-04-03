define [
  "module"
  "./mod"
  "./modB"
], (module, mod)->
  mod.init module.config().name