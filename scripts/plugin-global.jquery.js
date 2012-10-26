$.fn.pluginGlobal = function() {
  return $(this).append("<div data-plugin-jquery-depends='window' data-plugin-global-jquery='" + $.fn.jquery + "'><strong>plugin-global-jquery</strong>: " + $.fn.jquery + "</div>");
};
