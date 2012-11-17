(->
  config1 =
    baseUrl: "scripts"
    urlArgs: "bust=" + (new Date()).getTime()
    paths:
      "jquery-1.7.1": "lib/jquery-1.7.1"
      "jquery-1.8.2": "lib/jquery-1.8.2"

    context: "context1"
    config:
      a:
        name: "context1_a"

      b:
        name: "context1_b"

  config2 =
    context: "context2"
    config:
      a:
        name: "context2_a"

      b:
        name: "context2_b"

  config2.baseUrl = config1.baseUrl
  config2.urlArgs = config1.urlArgs
  config2.paths = config1.paths

  require config1, ["a"]
  require config2, ["a"]
)()