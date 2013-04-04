define(['./minimal_requests'], function() {
  return describe('getJQuery! loader plugin network requests', function() {
    beforeEach(function() {
      return waitsFor(function() {
        return window.require_contexts_loaded;
      });
    });
    describe("when multiple contexts require getJQuery!1.7.1", function() {
      return it('there should only be one associated script tag', function() {
        return expect($('[data-requiremodule="jquery-1.7.1"]').length).toBe(1);
      });
    });
    return describe("when multiple contexts require getJQuery!1.8.2", function() {
      return it('there should only be one associated script tag', function() {
        return expect($('[data-requiremodule="jquery-1.8.2"]').length).toBe(1);
      });
    });
  });
});
