define([], function() {
  var config1, config2, consoleReporter, htmlReporter, intrvl, jasmineEnv, l1, l2;

  jasmineEnv = jasmine.getEnv();
  jasmineEnv.updateInterval = 1000;
  htmlReporter = new jasmine.HtmlReporter();
  consoleReporter = new jasmine.ConsoleReporter();
  jasmineEnv.addReporter(htmlReporter);
  jasmineEnv.addReporter(consoleReporter);
  jasmineEnv.specFilter = function(spec) {
    return htmlReporter.specFilter(spec);
  };
  config1 = $.extend(true, {}, require.s.contexts._.config, {
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
  config2 = $.extend(true, {}, require.s.contexts._.config, {
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
  l1 = l2 = false;
  require(config1, ["spec/tests1", "spec/tests2"], function() {
    return l1 = true;
  });
  require(config2, ["spec/tests1", "spec/tests2"], function() {
    return l2 = true;
  });
  return intrvl = setInterval(function() {
    if (l1 && l2) {
      clearInterval(intrvl);
      return jasmineEnv.execute();
    }
  }, 100);
});
