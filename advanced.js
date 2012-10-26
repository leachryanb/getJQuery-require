  define([
    'getJQuery!1.7.1[plugin-1.7.1.jquery]',
    'getJQuery!1.8.2[plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]',
    'getJQuery!1.8.2[plugin-global.jquery]'
  ], function($171, $182) {

    $(function() {
      var body = $('body').append('<p>' + $.fn.jquery + '</p>'));
      $171('<p>171</p>').plugin171().appendTo(body);
      $182('<p>182</p>').plugin182().appendTo(body);
      $182('<p>182</p>').pluginDoesntCare().appendTo(body);
    });

  });