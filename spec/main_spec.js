define([], function() {
  var config1, config2;

  config1 = $.extend(require.s.contexts._.config, {
    context: "context1",
    config: {
      "spec/tests1": {
        name: "context1_a"
      },
      "spec/tests2": {
        name: "context1_b"
      }
    }
  });
  config2 = $.extend(require.s.contexts._.config, {
    context: "context2",
    config: {
      "spec/tests1": {
        name: "context2_a"
      },
      "spec/tests2": {
        name: "context2_b"
      }
    }
  });
  require(config1, ["spec/tests1"]);
  return require(config2, ["spec/tests1"]);
});
