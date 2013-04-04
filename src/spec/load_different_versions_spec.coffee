describe "getJQuery! loader plugin", ->

  describe "On the window (#{$.fn.jquery})", ->

    it 'plugin171 should be undefined', ->
      expect($.fn["plugin171"]).toBeUndefined()

    it 'plugin182 should be undefined', ->
      expect($.fn["plugin182"]).toBeUndefined()

  describe "For the default context", ->
    $171 = $182 = null

    beforeEach ->
      waitsFor ->
        require_contexts_loaded

      runs ->
        req = require.config context: '_'
        mod = req 'spec/fixtures/module'
        $171 = mod.jquery_171
        $182 = mod.jquery_182

    it "Local $171 should be defined", ->
      expect($171).toBeDefined()
      expect($171.fn).toBeDefined()

    it "Local $182 should be defined", ->
      expect($182).toBeDefined()
      expect($182.fn).toBeDefined()

  describe "For context1", ->
    $171 = $182 = null

    beforeEach ->
      waitsFor ->
        require_contexts_loaded

      runs ->
        req = require.config context: 'context1'
        mod = req 'spec/fixtures/module'
        $171 = mod.jquery_171
        $182 = mod.jquery_182
        $182_2 = mod.jquery_182_2

    it "Local $171 should be defined", ->
      expect($171).toBeDefined()
      expect($171.fn).toBeDefined()

    it "Local $182 should be defined", ->
      expect($182).toBeDefined()
      expect($182.fn).toBeDefined()

  describe "For context2", ->
    $171 = $182 = null

    beforeEach ->
      waitsFor ->
        require_contexts_loaded

      runs ->
        req = require.config context: 'context2'
        mod = req 'spec/fixtures/module'
        $171 = mod.jquery_171
        $182 = mod.jquery_182
        $182_2 = mod.jquery_182_2

    it "Local $171 should be defined", ->
      expect($171).toBeDefined()
      expect($171.fn).toBeDefined()

    it "Local $182 should be defined", ->
      expect($182).toBeDefined()
      expect($182.fn).toBeDefined()

