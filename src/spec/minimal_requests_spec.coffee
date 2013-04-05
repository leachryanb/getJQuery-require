define ['./minimal_requests'], (setup)->
  describe 'getJQuery! loader plugin network requests', ->

    beforeEach ->
      waitsFor ->
        setup.ready()

    describe "when multiple contexts require getJQuery!1.7.1", ->

      it 'there should only be one associated script tag', ->
        expect($('[data-requiremodule="jquery-1.7.1"]').length).toBe(1)

    describe "when multiple contexts require getJQuery!1.8.2", ->

      it 'there should only be one associated script tag', ->
        expect($('[data-requiremodule="jquery-1.8.2"]').length).toBe(1)

    # describe "when multiple contexts require getJQuery!1.7.1['jquery-ui-1.9.0']", ->

    #   it 'there should only be one associated script tag', ->
    #     expect(require).toBe(1)

