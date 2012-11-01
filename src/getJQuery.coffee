define ->
  #
  #   * Expects:
  #   * A path config mapping 'jquery-n.n.n' to the appropriate jquery version file
  #
  versionedPlugins = {}
  errorMsg = (version) ->
    "jquery-#{version} could not be loaded. getJQuery! loader expects a semantic version number"

  storePlugins = (plugins, name) ->
    versionedPlugins[name] = []  unless versionedPlugins[name]
    i = 0
    len = plugins.length

    while i < len
      versionedPlugins[name].push "text!#{plugins[i].trim()}.js"
      i++

  loadPlugins = (req, $, plugins, load) ->
    jQuery = $
    req plugins, ->
      i = 0
      len = arguments.length

      while i < len
        pluginText = arguments[i]
        eval pluginText
        i++
      load $

    plugins = []

  normalize: (name, normalize) ->
    plugins = []
    plgnRe = /^([0-9]*\.[0-9]*\.[0-9]*)(\[(.+?)\])?$/g
    segs = plgnRe.exec(name)

    return normalize(name)  unless segs

    version = segs[1]
    throw errorMsg(version)  if isNaN(parseFloat(version))

    name = "jquery-" + version
    storePlugins segs[3].split(","), name  if segs[3]
    normalize name

  load: (name, req, load, config) ->
    req [name], ->
      $L = jQuery.noConflict(true).sub()
      if versionedPlugins[name] and versionedPlugins[name].length
        loadPlugins req, $L, versionedPlugins[name], load
      else
        load $L
