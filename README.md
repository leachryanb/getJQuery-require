getJQuery-require
=================

RequireJS loader plugin for returning an isolated version of jQuery with associated plugins

## User Stories:
- As a module creator 
- within a specific require context 
- and without affecting the fn of the hosting page or any other require context, I would like to:
  - Load any version of jQuery I need
  - Load plugins onto the fn of my specific jQuery version
  - Have referential integrity on a required jQuery version such that any module within my require context can share plugins 

## Basic Usage
``` JavaScript
define([
  'getJQuery!1.8.2[plugin1.jquery.js, plugin2.jquery.js]'
], function($) {

  $('#myDivForPlugin1').plugin1();
  $('#myDivForPlugin2').plugin2();

});
```

## More Advanced Usage
``` JavaScript
define([
  'getJQuery!1.7.1[plugin-1.7.1.jquery]',
  'getJQuery!1.8.2[plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]',
  'getJQuery!1.8.2[plugin.jquery]'
], function($171, $182) {

  $(function() {
    var body = $('body').append('<p>' + $.fn.jquery + '</p>'));
    $171('<p>171</p>').plugin171().appendTo(body);
    $182('<p>182</p>').plugin182().appendTo(body);
    $182('<p>182</p>').pluginDoesntCare().appendTo(body);
  });

});
```