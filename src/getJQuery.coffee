###
  @License
  Version: 0.1.0 (11/17/2012)
  Author: Ryan Leach
  Released under the MIT license
###

define ->
  ###
    Expects: A path config mapping 'jquery-n.n.n' to the appropriate jquery version file
  ###

  errorMsg = (version) ->
    "jquery-#{version} could not be loaded. getJQuery! loader expects a semantic version number"

  loadPlugins = (plugins, the$, req, onLoad)->
    jQuery = $ = the$
    req plugins, ->
      for i in [0..arguments.length-1]
        pluginText = arguments[i]
        eval pluginText
      onLoad? the$

  load: (name, req, onLoad, config) ->
    if config.isBuild
      onLoad()
    else
      versionRe = /([0-9]*\.[0-9]*\.[0-9]*)/g
      pluginRe = /\[([^\]]*)\]/

      try
        version = name.match(versionRe)[0]
      catch e
        throw errorMsg(name)

      plugins = if pluginRe.exec(name) then pluginRe.exec(name)[1].split(',') else []

      name = "jquery-#{version}"
      config.shim ?= {}
      config.shim[name] =
        exports: '$'
        init: ->
          my$ = window.$.noConflict(true).sub()
          my$._r_context = config.context
          my$._r_contextId = new Date().getTime()
          my$

      if plugins.length
        plugins = ("text!#{plugin.trim()}.js" for plugin in plugins)
        config.shim[plugin] = [name] for plugin in plugins
        require config, [name], (the$)->
          loadPlugins plugins, the$, req, onLoad
      else
        require config, [name], (the$)->
          onLoad the$
