describe("getJQuery! loader plugin", function() {
  describe("On the window (" + $.fn.jquery + ")", function() {
    it('plugin171 should be undefined', function() {
      return expect($.fn["plugin171"]).toBeUndefined();
    });
    return it('plugin182 should be undefined', function() {
      return expect($.fn["plugin182"]).toBeUndefined();
    });
  });
  describe("For the default context", function() {
    var $171, $182, $182_2;

    $171 = $182 = $182_2 = null;
    beforeEach(function() {
      waitsFor(function() {
        return require_contexts_loaded;
      });
      return runs(function() {
        var mod, req;

        req = require.config({
          context: '_'
        });
        mod = req('spec/fixtures/module');
        $171 = mod.jquery_171;
        return $182 = mod.jquery_182;
      });
    });
    it("Local $171 should be defined", function() {
      expect($171).toBeDefined();
      return expect($171.fn).toBeDefined();
    });
    it("Local $182 should be defined", function() {
      expect($182).toBeDefined();
      return expect($182.fn).toBeDefined();
    });
    it("plugin171 should be undefined", function() {
      return expect($171.fn["plugin171"]).toBeUndefined();
    });
    it("plugin182 should be undefined", function() {
      return expect($171.fn["plugin182"]).toBeUndefined();
    });
    return it("pluginGlobal should be undefined", function() {
      return expect($171.fn["pluginGlobal"]).toBeUndefined();
    });
  });
  return describe("For context1", function() {
    var $171, $182, $182_2;

    $171 = $182 = $182_2 = null;
    beforeEach(function() {
      waitsFor(function() {
        return require_contexts_loaded;
      });
      return runs(function() {
        var mod, req;

        req = require.config({
          context: 'context1'
        });
        mod = req('spec/fixtures/module_with_plugins');
        $171 = mod.jquery_171;
        $182 = mod.jquery_182;
        return $182_2 = mod.jquery_182_2;
      });
    });
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
});
