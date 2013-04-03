define(["getJQuery!1.7.1[./fixtures/plugin-1-7-1-jquery]", "getJQuery!1.8.2[./fixtures/plugin-global-jquery, ./fixtures/plugin-1-8-2-jquery]", "getJQuery!1.8.2[./fixtures/plugin-global-jquery, ./fixtures/plugin-1-8-2-jquery]", "./fixtures/plugin-global-jquery.js"], function($171, $182, $182_2) {
  var $global;

  $global = window.$ ? window.$ : {
    fn: {
      jquery: "undefined"
    }
  };
  return {
    init: function(name) {
      return describe("getJQuery! loader plugin for context: " + name, function() {
        describe("On the window scope (" + $global.fn.jquery + ")", function() {
          it('plugin171 should be undefined', function() {
            return expect($global.fn["plugin171"]).toBeUndefined();
          });
          return it('plugin182 should be undefined', function() {
            return expect($global.fn["plugin182"]).toBeUndefined();
          });
        });
        describe("On the locally scoped jQuery: $171 (" + $171.fn.jquery + ")", function() {
          it("plugin171 should be defined", function() {
            return expect($171.fn["plugin171"]).toBeDefined();
          });
          it("plugin182 should be undefined", function() {
            return expect($171.fn["plugin182"]).toBeUndefined();
          });
          it("pluginGlobal should be undefined", function() {
            return expect($171.fn["pluginGlobal"]).toBeUndefined();
          });
          return xit("widget should be undefined", function() {
            return expect($171.widget).toBeUndefined();
          });
        });
        describe("On the locally scoped jQuery: $182 (" + $182.fn.jquery + ")", function() {
          it("plugin171 should be undefined", function() {
            return expect($182.fn["plugin171"]).toBeUndefined();
          });
          it("plugin182 should be defined", function() {
            return expect($182.fn["plugin182"]).toBeDefined();
          });
          it("pluginGlobal should be defined", function() {
            return expect($182.fn["pluginGlobal"]).toBeDefined();
          });
          return xit("widget should be defined", function() {
            return expect($182.widget).toBeDefined();
          });
        });
        return describe("On the second locally scoped jQuery: $182_2 (" + $182_2.fn.jquery + ")", function() {
          it("plugin171 should be undefined", function() {
            return expect($182_2.fn["plugin171"]).toBeUndefined();
          });
          it("plugin182 should be defined", function() {
            return expect($182_2.fn["plugin182"]).toBeDefined();
          });
          it("pluginGlobal should be defined", function() {
            return expect($182_2.fn["pluginGlobal"]).toBeDefined();
          });
          return xit("widget should be defined", function() {
            return expect($182_2.widget).toBeDefined();
          });
        });
      });
    }
  };
});
