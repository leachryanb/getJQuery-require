(function($) {

  define([
    'module',
    'getJQuery!1.7.1[plugin-1.7.1.jquery]',
    'getJQuery!1.8.2[plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]',
    'getJQuery!1.8.2[plugin-global.jquery]' // FAILS
  ], function(module, $171, $182) {

    var assert, versionContent, ui190Vers = null, uiVers = null;

    assert = function($ns, name, assertVal, scope) {
      var fn;
      fn = $ns.jquery ? $ns : $ns.fn;
      if (!window.console || !console.assert) {
        window.console = {
          assert: function(val, msg) {
            $('<p>' + val + ': ' + msg + '</p>').appendTo($('body'));
          }
        };
      }
      return console.assert(typeof $ns[name] === assertVal, "Expect " + name + " on <strong>" + scope + "</strong> jquery(" + fn.jquery + ") to be <strong>" + assertVal + "</strong> got <strong>" + (typeof $ns[name]) + "</strong>");
    };

    versionContent = function(version, attr, name) {
      return "<div style=\"padding-top: 10px;\" data-" + attr + "=\"" + version + "\"><strong>Module is rendering " + name + " on an element wrapped by jQuery version: </strong>" + version + "</div>";
    };

    if ($.ui) {
      uiVers = $.ui.version;
    }

    if ($182.ui) {
      ui190Vers = $182.ui.version;
    }

    assert($.fn, 'plugin171', 'undefined', 'global');
    assert($.fn, 'plugin182', 'undefined', 'global');

    assert($171.fn, 'plugin171', 'function', "local (" + $171.fn.jquery + ")");
    assert($171.fn, 'plugin182', 'undefined', "local (" + $171.fn.jquery + ")");
    assert($171.fn, 'pluginGlobal', 'undefined', "local (" + $171.fn.jquery + ")");

    assert($171, 'widget', 'undefined', "local (" + $171.fn.jquery + ")");

    assert($182.fn, 'plugin171', 'undefined', "local (" + $182.fn.jquery + ")");
    assert($182.fn, 'plugin182', 'function', "local (" + $182.fn.jquery + ")");
    assert($182.fn, 'pluginGlobal', 'function', "local (" + $182.fn.jquery + ")");

    assert($182, 'widget', 'function', "local (" + $182.fn.jquery + ")");

    console.assert(ui190Vers !== uiVers, "Expect jquery-ui version(1.9.0) isn't window's jquery-ui version(1.8.24) got " + (ui190Vers !== uiVers));

    $(function() {
      var body = $('body').append('<p>' + versionContent($.fn.jquery, 'window-jquery', 'Module (' + module.config().name + ') thinks that window jQuery version is: ')),
        content_171     = versionContent($171.fn.jquery, 'plugin-jquery', 'plugin171'),
        content_182     = versionContent($182.fn.jquery, 'plugin-jquery', 'plugin182'),
        content_global  = versionContent($182.fn.jquery, 'plugin-jquery', 'pluginGlobal');

      $171(content_171).plugin171().appendTo(body);
      $182(content_182).plugin182().appendTo(body);
      $182('<div/>').progressbar({ value: 20 }).appendTo(body);

      $182(content_global).pluginGlobal().appendTo(body);

    });

  });

})(jQuery)