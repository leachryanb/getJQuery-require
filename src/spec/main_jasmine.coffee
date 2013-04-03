(->
  jasmineEnv = jasmine.getEnv()
  jasmineEnv.updateInterval = 1000
  htmlReporter = new jasmine.HtmlReporter()
  consoleReporter = new jasmine.ConsoleReporter()
  jasmineEnv.addReporter htmlReporter
  jasmineEnv.addReporter consoleReporter
  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec

  config1 =
    baseUrl: "scripts"
    urlArgs: "bust=" + (new Date()).getTime()
    paths:
      "jquery-1.7.1": "lib/jquery-1.7.1"
      "jquery-1.8.2": "lib/jquery-1.8.2"

    context: "context1"
    config:
      "specs/tests1":
        name: "context1_tests1"

      "specs/tests2":
        name: "context1_tests2"

  config2 =
    context: "context2"
    config:
      "specs/tests1":
        name: "context2_tests1"

      "specs/tests2":
        name: "context2_tests2"

  config2.baseUrl = config1.baseUrl
  config2.paths = config1.paths
  config2.urlArgs = config1.urlArgs
  require config1, ["specs/tests1"], ->
    l1 = true

  require config2, ["specs/tests2"], ->
    l2 = true

  intrvl = setInterval(->
    if l1 and l2
      clearInterval intrvl
      jasmineEnv.execute()
  , 10)
)()