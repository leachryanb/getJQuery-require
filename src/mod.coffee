define [
  "getJQuery!1.7.1[plugin-1.7.1.jquery]"
  "getJQuery!1.8.2[plugin-global.jquery, plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]"
  "./scripts/plugin-global.jquery.js"
], ($171, $182) ->

  init: (name)->
    win$ = window.$
    strap$ = win$
    if not win$
      win$ = fn: jquery: "undefined"
      strap$ = $182

    versionContent = (version, name, pluginName) ->
      "<h3 data-#{name}-#{pluginName}=\"#{version}\">Module is rendering #{pluginName} on an element wrapped by #{name} version:#{version}</h3>"

    strap$ ->
      elem = strap$('<section/>').append("<h2>Module (#{name}) thinks that window jQuery version is: #{win$.fn.jquery}</h2>")

      content_171 = versionContent($171.fn.jquery, "jQuery171", "plugin171")
      content_182 = versionContent($182.fn.jquery, "jQuery182", "plugin182")
      content_global = versionContent(strap$.fn.jquery, "jQueryWindow", "pluginGlobal")

      $171(content_171).appendTo(elem).after($171('<div/>').plugin171())
      $182(content_182).appendTo(elem).after($182('<div/>').plugin182())
      if window.$
        $(content_global).appendTo(elem).after($('<div/>').pluginGlobal())

      elem = $182(elem.get(0))
      strap$("body").append elem
      if elem.accordion
        elem.accordion({ header: 'h3' })
