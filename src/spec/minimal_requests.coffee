define ['./require_reset'], (resetter)->
  resetter.reset()

  c_ = c1 = c2 = false
  context_ =
    baseUrl: './'
    paths:
      "jquery-1.7.1": "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min"
      "jquery-1.8.2": "http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min"
      "jquery-ui-1.9.0": "http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"
      "jquery-ui-1.8.24": "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"
    map:
      '*':
        'plugin-1-7-1-jquery': 'spec/fixtures/plugin-1-7-1-jquery'
        'plugin-1-8-2-jquery': 'spec/fixtures/plugin-1-8-2-jquery'
    config:
      getJQuery:
        pluginContexts:
          '_': [
            'plugin-1-7-1-jquery'
            'plugin-1-8-2-jquery'
          ]

  context1 = $.extend true, {}, context_, context: "context1"
  context2 = $.extend true, {}, context_, context: "context2"

  require context_, ["spec/fixtures/module"], -> c_ = true
  require context1, ["spec/fixtures/module", "spec/fixtures/module_with_plugins"], -> c1 = true
  require context2, ["spec/fixtures/module", "spec/fixtures/module_with_plugins"], -> c2 = true

  intrvl = setInterval ->
    if c_ and c1 and c2
      clearInterval intrvl
      window.require_contexts_loaded = true
  , 10
