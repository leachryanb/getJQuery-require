define(['./plugin_isolation'], function() {
  return describe('getJQuery! loader isolates jQuery plugins within a context', function() {
    describe("on the window $(" + $.fn.jquery + ")", function() {
      it('plugin171 should be undefined', function() {
        return expect($.fn['plugin171']).toBeUndefined();
      });
      it('plugin182 should be undefined', function() {
        return expect($.fn['plugin182']).toBeUndefined();
      });
      return describe('(because it was required in a module without getJQuery)', function() {
        return it('pluginGlobal should be defined', function() {
          return expect($.fn['pluginGlobal']).toBeDefined();
        });
      });
    });
    describe('on modules in the default context', function() {
      var $171, $182, $182_2;

      $171 = $182 = $182_2 = null;
      beforeEach(function() {
        waitsFor(function() {
          return window.require_contexts_loaded;
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
      describe('for $171', function() {
        it('plugin171 should be undefined', function() {
          return expect($171.fn['plugin171']).toBeUndefined();
        });
        it('plugin182 should be undefined', function() {
          return expect($171.fn['plugin182']).toBeUndefined();
        });
        return it('pluginGlobal should be undefined', function() {
          return expect($171.fn['pluginGlobal']).toBeUndefined();
        });
      });
      return describe('for $182', function() {
        it('plugin171 should be undefined', function() {
          return expect($182.fn['plugin171']).toBeUndefined();
        });
        it('plugin182 should be undefined', function() {
          return expect($182.fn['plugin182']).toBeUndefined();
        });
        return it('pluginGlobal should be undefined', function() {
          return expect($182.fn['pluginGlobal']).toBeUndefined();
        });
      });
    });
    describe('on modules in context1', function() {
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
      describe('for $171', function() {
        it('plugin171 should be defined', function() {
          return expect($171.fn['plugin171']).toBeDefined();
        });
        it('plugin182 should be undefined', function() {
          return expect($171.fn['plugin182']).toBeUndefined();
        });
        return it('pluginGlobal should be undefined', function() {
          return expect($171.fn['pluginGlobal']).toBeUndefined();
        });
      });
      return describe('for $182', function() {
        it('plugin182 should be defined', function() {
          return expect($182.fn['plugin182']).toBeDefined();
        });
        it('plugin171 should be undefined', function() {
          return expect($182.fn['plugin171']).toBeUndefined();
        });
        return it('pluginGlobal should be undefined', function() {
          return expect($182.fn['pluginGlobal']).toBeUndefined();
        });
      });
    });
    return describe('on modules in context2', function() {
      var $171, $182, $182_2;

      $171 = $182 = $182_2 = null;
      beforeEach(function() {
        waitsFor(function() {
          return require_contexts_loaded;
        });
        return runs(function() {
          var mod, req;

          req = require.config({
            context: 'context2'
          });
          mod = req('spec/fixtures/module_with_plugins');
          $171 = mod.jquery_171;
          $182 = mod.jquery_182;
          return $182_2 = mod.jquery_182_2;
        });
      });
      describe('for $171', function() {
        it('plugin171 should be defined', function() {
          return expect($171.fn['plugin171']).toBeDefined();
        });
        it('plugin182 should be undefined', function() {
          return expect($171.fn['plugin182']).toBeUndefined();
        });
        return it('pluginGlobal should be undefined', function() {
          return expect($171.fn['pluginGlobal']).toBeUndefined();
        });
      });
      return describe('for $182', function() {
        it('plugin182 should be defined', function() {
          return expect($182.fn['plugin182']).toBeDefined();
        });
        it('plugin171 should be undefined', function() {
          return expect($182.fn['plugin171']).toBeUndefined();
        });
        return it('pluginGlobal should be undefined', function() {
          return expect($182.fn['pluginGlobal']).toBeUndefined();
        });
      });
    });
  });
});
