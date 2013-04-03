define(["module", "./mod", "./modB"], function(module, mod) {
  return mod.init(module.config().name);
});
