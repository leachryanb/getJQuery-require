try {
$.fn.pluginGlobal = function() {
  return $(this).append("<p data-plugin-jquery-depends='window' data-plugin-global-jquery='" + $.fn.jquery + "'>pluginGlobal jQuery version is: " + $.fn.jquery + "</p>");
};
} catch (ex) {}
