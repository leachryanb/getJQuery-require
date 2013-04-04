define(['./load_different_versions'], function() {
  return describe('getJQuery! loader plugin allows loading different versions of jQuery per context', function() {
    describe("On the window $(" + $.fn.jquery + ")", function() {
      it('plugin171 should be undefined', function() {
        return expect($.fn['plugin171']).toBeUndefined();
      });
      return it('plugin182 should be undefined', function() {
        return expect($.fn['plugin182']).toBeUndefined();
      });
    });
    describe('For the default context', function() {
      var $171, $182;

      $171 = $182 = null;
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
      it('Local $171 should be defined', function() {
        expect($171).toBeDefined();
        return expect($171.fn).toBeDefined();
      });
      return it('Local $182 should be defined', function() {
        expect($182).toBeDefined();
        return expect($182.fn).toBeDefined();
      });
    });
    describe('For context1', function() {
      var $171, $182;

      $171 = $182 = null;
      beforeEach(function() {
        waitsFor(function() {
          return require_contexts_loaded;
        });
        return runs(function() {
          var $182_2, mod, req;

          req = require.config({
            context: 'context1'
          });
          mod = req('spec/fixtures/module');
          $171 = mod.jquery_171;
          $182 = mod.jquery_182;
          return $182_2 = mod.jquery_182_2;
        });
      });
      it('Local $171 should be defined', function() {
        expect($171).toBeDefined();
        return expect($171.fn).toBeDefined();
      });
      return it('Local $182 should be defined', function() {
        expect($182).toBeDefined();
        return expect($182.fn).toBeDefined();
      });
    });
    return describe('For context2', function() {
      var $171, $182;

      $171 = $182 = null;
      beforeEach(function() {
        waitsFor(function() {
          return require_contexts_loaded;
        });
        return runs(function() {
          var $182_2, mod, req;

          req = require.config({
            context: 'context2'
          });
          mod = req('spec/fixtures/module');
          $171 = mod.jquery_171;
          $182 = mod.jquery_182;
          return $182_2 = mod.jquery_182_2;
        });
      });
      it('Local $171 should be defined', function() {
        expect($171).toBeDefined();
        return expect($171.fn).toBeDefined();
      });
      return it('Local $182 should be defined', function() {
        expect($182).toBeDefined();
        return expect($182.fn).toBeDefined();
      });
    });
  });
});
