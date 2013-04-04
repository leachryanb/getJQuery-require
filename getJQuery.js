/*
  @License
  Version: 0.1.1 (02/08/2013)
  Author: Ryan Leach
  Released under the MIT license
*/

var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

define(['module'], function(module) {
  var errorMsg, loadPlugins, masterConfig, parsePlugins, parseVersion, textifyPlugins;

  masterConfig = typeof module.config === "function" ? module.config() : void 0;
  if (!masterConfig.jQueryContext) {
    masterConfig.jQueryContext = "_";
  }
  /*
    Expects: A path config mapping 'jquery-n.n.n' to the appropriate jquery version file
  */

  errorMsg = function(version) {
    return "jquery-" + version + " could not be loaded. getJQuery! loader expects a semantic version number";
  };
  textifyPlugins = function(plugins, req) {
    var plugin, url, _i, _len, _plugins;

    _plugins = [];
    for (_i = 0, _len = plugins.length; _i < _len; _i++) {
      plugin = plugins[_i];
      url = req.toUrl(plugin);
      if (!url.match(/^empty:/)) {
        _plugins.push("text!" + plugin + ".js");
      }
    }
    return _plugins;
  };
  parsePlugins = function(name) {
    var plugin, pluginRe, plugins, _i, _len, _results;

    pluginRe = /\[([^\]]*)\]/;
    plugins = (pluginRe.exec(name) ? pluginRe.exec(name)[1].split(",") : []);
    _results = [];
    for (_i = 0, _len = plugins.length; _i < _len; _i++) {
      plugin = plugins[_i];
      _results.push(plugin.trim());
    }
    return _results;
  };
  parseVersion = function(name) {
    var e, versionRe;

    versionRe = /([0-9]*\.[0-9]*\.[0-9]*)/g;
    try {
      return name.match(versionRe)[0];
    } catch (_error) {
      e = _error;
      throw errorMsg(name);
    }
  };
  loadPlugins = function(plugins, the$, req, onLoad, context) {
    var $, completeCheck, contextName, contextPlugins, jQuery, loadPluginContext, loadingContexts, _plugins, _ref, _req;

    jQuery = $ = the$;
    loadingContexts = [];
    completeCheck = function(_context) {
      if (__indexOf.call(loadingContexts, _context) >= 0) {
        loadingContexts.splice(loadingContexts.indexOf(_context), 1);
      }
      if (!loadingContexts.length) {
        return typeof onLoad === "function" ? onLoad(the$) : void 0;
      }
    };
    loadPluginContext = function(_req, _plugins, _context) {
      if (!_plugins.length) {
        return completeCheck(_context);
      }
      if (_context) {
        loadingContexts.push(_context);
      }
      _plugins = textifyPlugins(_plugins, _req);
      return _req(_plugins, function() {
        var i, pluginText, _i, _ref;

        for (i = _i = 0, _ref = arguments.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          pluginText = arguments[i];
          eval(pluginText);
        }
        return completeCheck(_context, function(err) {
          return console.log(err);
        });
      });
    };
    if (masterConfig.pluginContexts) {
      _ref = masterConfig.pluginContexts;
      for (contextName in _ref) {
        contextPlugins = _ref[contextName];
        _req = requirejs({
          context: contextName
        });
        _plugins = contextPlugins.filter(function(contextPlugin) {
          var match;

          match = __indexOf.call(plugins, contextPlugin) >= 0;
          console.log(contextPlugin);
          if (match) {
            plugins.splice(plugins.indexOf(contextPlugin), 1);
          }
          return match;
        });
        loadPluginContext(_req, _plugins, contextName);
      }
      return loadPluginContext(req, plugins);
    } else {
      return loadPluginContext(req, plugins);
    }
  };
  return {
    load: function(name, req, onLoad, config) {
      var plugins, version, _ref, _req;

      plugins = parsePlugins(name);
      if (config.isBuild) {
        if (plugins.length) {
          plugins = textifyPlugins(plugins, req);
          return req(plugins, function(content) {
            return onLoad(content);
          });
        } else {
          return onLoad();
        }
      } else {
        version = parseVersion(name);
        name = "jquery-" + version;
        if ((_ref = config.shim) == null) {
          config.shim = {};
        }
        config.shim[name] = {
          exports: '$',
          init: function() {
            return window.$.noConflict(true);
          }
        };
        _req = requirejs(config);
        if (masterConfig.jQueryContext) {
          _req = requirejs({
            context: masterConfig.jQueryContext,
            shim: config.shim
          });
        }
        return _req([name], function(the$) {
          if (!req.defined(name)) {
            the$ = the$.sub();
          }
          if (plugins.length) {
            return loadPlugins(plugins, the$, req, onLoad, config.context);
          } else {
            return onLoad(the$);
          }
        });
      }
    }
  };
});
