define([], function() {
  var delete_em;

  delete_em = ['getJQuery!', 'text!', 'jquery-', '-jquery'];
  return {
    reset: function() {
      var context, contextName, module, moduleId, stub, _i, _len, _ref, _ref1;

      _ref = requirejs.s.contexts;
      for (contextName in _ref) {
        context = _ref[contextName];
        _ref1 = context.defined;
        for (moduleId in _ref1) {
          module = _ref1[moduleId];
          for (_i = 0, _len = delete_em.length; _i < _len; _i++) {
            stub = delete_em[_i];
            if (moduleId.indexOf(stub) >= 0) {
              console.log(moduleId);
            }
            if (moduleId.indexOf(stub) >= 0) {
              context.require.undef(moduleId);
            }
          }
        }
      }
      return window.require_contexts_loaded = false;
    }
  };
});
