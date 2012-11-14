(($) ->
  define [
    "module",
    "getJQuery!1.7.1[plugin-1.7.1.jquery]",
    "getJQuery!1.8.2[plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]",
    "getJQuery!1.8.2[plugin-global.jquery, plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]"
  ], (module, $171, $182, $182_2) ->

    assert = ($ns, name, assertVal, scope) ->
      fn = (if $ns.jquery then $ns else $ns.fn)
      if not window.console or not console.assert
        window.console = assert: (val, msg) ->
          $("<p>#{val}: #{msg}</p>").appendTo $("body")
      console.log typeof $ns[name] is assertVal, "Expect #{name} on <strong>#{scope}</strong> jquery(#{fn.jquery}) to be <strong>#{assertVal}</strong> got <strong>#{(typeof $ns[name])}</strong>"

    versionContent = (version, name, pluginName) ->
      "<h3 data-#{name}-#{pluginName}=\"#{version}\">Module is rendering #{pluginName} on an element wrapped by #{name} version:#{version}</h3>"

    uiVers = $.ui.version  if $.ui
    ui190Vers = $182.ui.version  if $182.ui

    assert $.fn, "plugin171", "undefined", "global"
    assert $.fn, "plugin182", "undefined", "global"
    assert $.fn, "plugin182", "undefined", "global"
    assert $171.fn, "plugin171", "function", "local (#{$171.fn.jquery})"
    assert $171.fn, "plugin182", "undefined", "local (#{$171.fn.jquery})"
    assert $171.fn, "pluginGlobal", "undefined", "local (#{$171.fn.jquery})"
    assert $171, "widget", "undefined", "local (#{$171.fn.jquery})"
    assert $182.fn, "plugin171", "undefined", "local (#{$182.fn.jquery})"
    assert $182.fn, "plugin182", "function", "local (#{$182.fn.jquery})"
    assert $182.fn, "pluginGlobal", "function", "local (#{$182.fn.jquery})"
    assert $182, "widget", "function", "local (#{$182.fn.jquery})"
    assert $182_2.fn, "plugin171", "undefined", "local (#{$182_2.fn.jquery})"
    assert $182_2.fn, "plugin182", "function", "local (#{$182_2.fn.jquery})"
    assert $182_2.fn, "pluginGlobal", "function", "local (#{$182_2.fn.jquery})"
    assert $182_2, "widget", "function", "local (#{$182_2.fn.jquery})"

    console.log ui190Vers isnt uiVers, "Expect jquery-ui version(1.9.0) isn\'t window\'s jquery-ui version(1.8.24) got #{ui190Vers isnt uiVers}"

    $ ->
      elem = $('<section/>').append("<h2>Module (#{module.config().name}) thinks that window jQuery version is: #{$.fn.jquery}</h2>")

      content_171 = versionContent($171.fn.jquery, "jQuery171", "plugin171")
      content_182 = versionContent($182.fn.jquery, "jQuery182", "plugin182")
      content_182_2 = versionContent($182_2.fn.jquery, "jQuery182_2", "plugin182")
      content_global = versionContent($182.fn.jquery, "jQuery182", "pluginGlobal")
      content_global_2 = versionContent($182_2.fn.jquery, "jQuery182_2", "pluginGlobal")

      $171(content_171).appendTo(elem).after($171('<div/>').plugin171())
      $182(content_182).appendTo(elem).after($182('<div/>').plugin182())
      $182_2(content_182_2).appendTo(elem).after($182_2('<div/>').plugin182())
      $182(content_global).appendTo(elem).after($182('<div/>').pluginGlobal())
      $182_2(content_global_2).appendTo(elem).after($182_2('<div/>').pluginGlobal())

      $("body").append elem
      elem.accordion({ header: 'h3', heightStyle: 'fill', collapsible: true })


) jQuery