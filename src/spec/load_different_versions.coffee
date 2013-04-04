define ['./require_reset'], (resetter)->
  resetter.reset()

  c_ = c1 = c2 = false
  context_ =
    baseUrl: './'
    paths:
      "jquery-1.7.1": "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min"
      "jquery-1.8.2": "http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min"

  context1 = context: "context1"
  context2 = context: "context2"

  require context_, ["spec/fixtures/module"], -> c_ = true
  require context1, ["spec/fixtures/module"], -> c1 = true
  require context2, ["spec/fixtures/module"], -> c2 = true

  intrvl = setInterval ->
    if c_ and c1 and c2
      clearInterval intrvl
      window.require_contexts_loaded = true
  , 10
