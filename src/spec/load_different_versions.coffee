define ['./require_reset'], (resetter)->
  resetter.reset()

  c_ = c1 = c2 = false
  context_ =
    baseUrl: './'
    paths:
      'jquery-1.7.1': 'vendor/jquery-1.7.1'
      'jquery-1.8.2': 'vendor/jquery-1.8.2'

  context1 = context: "context1"
  context2 = context: "context2"

  require context_, ["spec/fixtures/module"], -> c_ = true
  require context1, ["spec/fixtures/module"], -> c1 = true
  require context2, ["spec/fixtures/module"], -> c2 = true

  ready: ->
    c_ and c1 and c2
