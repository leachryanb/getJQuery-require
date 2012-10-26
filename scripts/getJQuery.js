define(function() {
  /*
   * Expects:
   * A path config mapping 'jquery-n.n.n' to the appropriate jquery version file
   */

  var errorMsg, loadPlugins, pluginModuleName;

  errorMsg = function(version) {
    return "jquery-" + version + " could not be loaded. getJQuery! loader expects a semantic version number";
  };

  pluginModuleName = function(plugin) {
    plugin = plugin.trim();
    return "text!" + plugin + ".js";
  };

  loadPlugins = function(req, $, plugins, load) {
    var jQuery, plugin;
    jQuery = $;
    plugins = (function() {
      var i, len, results = [];
      for (i = 0, len = plugins.length; i < len; i++) {
        plugin = plugins[i];
        results.push(pluginModuleName(plugin));
      }
      return results;
    })();

    req(plugins, function() {
      var i, len, pluginText;
      for (i = 0, len = arguments.length; i < len; i++) {
        pluginText = arguments[i];
        eval(pluginText);
      }
      load($);
    });
  };

  return {

    load: function(name, req, load, config) {
      var plgnRe, segs, version;
      plgnRe = /^([0-9]*\.[0-9]*\.[0-9]*)(\[(.+?)\])?$/ig;
      segs = plgnRe.exec(name);
      version = segs[1];

      if (isNaN(parseFloat(version))) {
        throw errorMsg(version);
      }

      req(["jquery-" + version], function() {
        var $L = jQuery.noConflict(true).sub();
        if (segs[3]) {
          return loadPlugins(req, $L, segs[3].split(','), load);
        } else {
          return load($L);
        }
      });
    }

  };

});
