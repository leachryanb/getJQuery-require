define(function() {
  /*
   * Expects:
   * A path config mapping 'jquery-n.n.n' to the appropriate jquery version file
   */

  var versionedPlugins = {}, versionPlugins, errorMsg, loadPlugins;

  errorMsg = function(version) {
    return "jquery-" + version + " could not be loaded. getJQuery! loader expects a semantic version number";
  };

  versionPlugins = function(plugins, name) {
    var i, len;
    if (!versionedPlugins[name]) {
      versionedPlugins[name] = [];
    }
    for (i = 0, len = plugins.length; i < len; i++) {
      versionedPlugins[name].push("text!" + plugins[i].trim() + ".js");
    }
  };

  loadPlugins = function(req, $, plugins, load) {
    var jQuery = $;
    req(plugins, function() {
      var i, len, pluginText;
      for (i = 0, len = arguments.length; i < len; i++) {
        pluginText = arguments[i];
        eval(pluginText);
      }
      load($);
    });
    plugins = [];
  };

  return {

    normalize: function(name, normalize) {
      var plgnRe, segs, version, plugins = [];

      plgnRe = /^([0-9]*\.[0-9]*\.[0-9]*)(\[(.+?)\])?$/ig;
      segs = plgnRe.exec(name);

      if (!segs) {
        return normalize(name);
      }

      version = segs[1];
      if (isNaN(parseFloat(version))) {
        throw errorMsg(version);
      }

      name = "jquery-" + version

      if (segs[3]) {
        versionPlugins(segs[3].split(','), name);
      }
      return normalize(name);
    },

    load: function(name, req, load, config) {
      req([name], function() {
        var $L = jQuery.noConflict(true).sub();
        if (versionedPlugins[name] && versionedPlugins[name].length) {
          return loadPlugins(req, $L, versionedPlugins[name], load);
        } else {
          return load($L);
        }
      });
    }

  };

});
