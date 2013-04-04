var require_contexts_loaded;

require_contexts_loaded = false;

define([], function() {
  var c1, c2, c_, context1, context2, context_, intrvl;

  c_ = c1 = c2 = false;
  context_ = {
    baseUrl: './',
    paths: {
      "jquery-1.7.1": "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min",
      "jquery-1.8.2": "http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min",
      "jquery-ui-1.9.0": "http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js",
      "jquery-ui-1.8.24": "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"
    }
  };
  context1 = {
    context: "context1"
  };
  context2 = {
    context: "context2"
  };
  require(context_, ["spec/fixtures/module"], function() {
    return c_ = true;
  });
  require(context1, ["spec/fixtures/module", "spec/fixtures/module_with_plugins"], function() {
    return c1 = true;
  });
  require(context2, ["spec/fixtures/module", "spec/fixtures/module_with_plugins"], function() {
    return c2 = true;
  });
  return intrvl = setInterval(function() {
    if (c_ && c1 && c2) {
      clearInterval(intrvl);
      return require_contexts_loaded = true;
    }
  }, 100);
});
