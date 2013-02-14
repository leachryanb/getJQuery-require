(->
  jasmineEnv = jasmine.getEnv()
  jasmineEnv.updateInterval = 1000
  htmlReporter = new jasmine.HtmlReporter()
  jasmineEnv.addReporter htmlReporter
  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec
  l1 = l2 = false

  config1 =
    baseUrl: "scripts"
    paths:
      "jquery-1.7.1": "lib/jquery-1.7.1"
      "jquery-1.8.2": "lib/jquery-1.8.2"

    context: "context1"

  config2 =
    context: "context2"
    paths:
      "jquery-1.7.1": "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min"
      "jquery-1.8.2": "http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min"
    # config:
    #   "getJQuery":
    #     jQueryContext: "context1"

  config2.baseUrl = config1.baseUrl

  require config1, ["specs/tests"], (tests)->
    tests.init(config1.context)
    l1 = true

  require config2, ["specs/tests"], (tests)->
    tests.init(config2.context)
    l2 = true

  intrvl = setInterval(->
    if l1 and l2
      clearInterval intrvl
      jasmineEnv.execute()
  , 10)
)()