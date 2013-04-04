define ['./minimal_requests'], ->
  describe 'getJQuery! loader plugin network requests', ->

    beforeEach ->
      waitsFor ->
        window.require_contexts_loaded

    describe "when multiple contexts require getJQuery!1.7.1", ->

      it 'there should only be one associated script tag', ->
        expect($('[data-requiremodule="jquery-1.7.1"]').length).toBe(1)

    describe "when multiple contexts require getJQuery!1.8.2", ->

      it 'there should only be one associated script tag', ->
        expect($('[data-requiremodule="jquery-1.8.2"]').length).toBe(1)

