define [], ->
  jasmineEnv = jasmine.getEnv()
  jasmineEnv.updateInterval = 1000
  htmlReporter = new jasmine.HtmlReporter()
  consoleReporter = new jasmine.ConsoleReporter()
  jasmineEnv.addReporter htmlReporter
  jasmineEnv.addReporter consoleReporter
  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec

  config1 = $.extend(true, {},
    require.s.contexts._.config,
    context: "context1"
    config:
      "spec/tests1":
        name: "context1_a"

      "spec/tests2":
        name: "context1_b"
    )

  config2 = $.extend(true, {},
    require.s.contexts._.config,
    context: "context2"
    config:
      "spec/tests1":
        name: "context2_a"

      "spec/tests2":
        name: "context2_b"
    )

  l1 = l2 = false
  require config1, ["spec/tests1", "spec/tests2"], ->
    l1 = true

  require config2, ["spec/tests1", "spec/tests2"], ->
    l2 = true

  intrvl = setInterval(->
    if l1 and l2
      clearInterval intrvl
      jasmineEnv.execute()
  , 100)
