define [
  "getJQuery!1.7.1[plugin-1-7-1-jquery]"
  "getJQuery!1.8.2[plugin-1-8-2-jquery]"
  "getJQuery!1.8.2[plugin-1-8-2-jquery]"
  "./plugin-global-jquery.js"
], ($171, $182, $182_2) ->

  console.log $171.fn['plugin171'], $182.fn['plugin182']

  jquery_171: $171
  jquery_182: $182
  jquery_182_2: $182_2