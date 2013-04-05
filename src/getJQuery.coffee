###
  @License
  Version: 0.1.1 (02/08/2013)
  Author: Ryan Leach
  Released under the MIT license
###

define [
  'module'
], (module)->

  masterConfig = module.config?()
  masterConfig.jQueryContext = "_" unless masterConfig.jQueryContext
  ###
    Expects: A path config mapping 'jquery-n.n.n' to the appropriate jquery version file
  ###

  errorMsg = (version) ->
    "jquery-#{version} could not be loaded. getJQuery! loader expects a semantic version number"

  textifyPlugins = (plugins, req) ->
    _plugins = []
    for plugin in plugins
      url = req.toUrl(plugin)
      unless url.match(/^empty:/)
        _plugins.push "text!#{plugin}.js"
    _plugins

  parsePlugins = (name) ->
    pluginRe = /\[([^\]]*)\]/
    plugins = (if pluginRe.exec(name) then pluginRe.exec(name)[1].split(",") else [])
    console.log plugins
    (plugin.trim() for plugin in plugins)

  parseVersion = (name) ->
    versionRe = /([0-9]*\.[0-9]*\.[0-9]*)/g
    try
      return name.match(versionRe)[0]
    catch e
      throw errorMsg(name)

  loadPlugins = (plugins, the$, req, onLoad, context)->

    jQuery = $ = the$
    loadingContexts = []

    completeCheck = (_context)->
      loadingContexts.splice(loadingContexts.indexOf(_context), 1) if _context in loadingContexts

      onLoad? the$ unless loadingContexts.length

    loadPluginContext = (_req, _plugins, _context)->
      return completeCheck _context unless _plugins.length
      loadingContexts.push _context if _context

      _plugins = textifyPlugins _plugins, _req

      _req _plugins, ->
        for i in [0..arguments.length-1]
          pluginText = arguments[i]
          eval pluginText
        completeCheck _context
        , (err)->
          console.log err

    if masterConfig.pluginContexts
      for contextName, contextPlugins of masterConfig.pluginContexts
        _req = requirejs context: contextName
        _plugins = contextPlugins.filter((contextPlugin)->
          match = contextPlugin in plugins
          plugins.splice(plugins.indexOf(contextPlugin), 1) if match
          match
        )
        loadPluginContext _req, _plugins, contextName

      loadPluginContext req, plugins
    else
      loadPluginContext req, plugins

  load: (name, req, onLoad, config) ->

    plugins = parsePlugins name

    if config.isBuild
      if plugins.length
        plugins = textifyPlugins plugins, req
        req plugins, (content) ->
          onLoad content
      else
        onLoad()
    else
      version = parseVersion(name)
      name = "jquery-#{version}"

      # If the window jQuery is the correct version, skip the request, just sub it
      the$ = if window.$.fn.jquery is version then window.$.sub()

      config.shim ?= {}
      config.shim[name] =
        exports: '$'
        init: ->
          window.$.noConflict(true)

      _req = requirejs
        context: masterConfig.jQueryContext
        shim: config.shim

      if the$
        loadPlugins plugins, the$, req, onLoad
      else
        _req [name], (the$)->
          the$ = the$.sub() unless req.defined(name)
          # console.log config.context, the$.name

          if plugins.length
            # pass in the original context require for the plugins
            loadPlugins plugins, the$, req, onLoad, config.context
          else
            onLoad the$
