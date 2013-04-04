describe "getJQuery! loader plugin", ->

  describe "On the window (#{$.fn.jquery})", ->

    it 'plugin171 should be undefined', ->
      expect($.fn["plugin171"]).toBeUndefined()

    it 'plugin182 should be undefined', ->
      expect($.fn["plugin182"]).toBeUndefined()

  describe "For the default context", ->
    $171 = $182 = $182_2 = null

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

    it "plugin171 should be undefined", ->
      expect($171.fn["plugin171"]).toBeUndefined()

    it "plugin182 should be undefined", ->
      expect($171.fn["plugin182"]).toBeUndefined()

    it "pluginGlobal should be undefined", ->
      expect($171.fn["pluginGlobal"]).toBeUndefined()

  describe "For context1", ->
    $171 = $182 = $182_2 = null

    beforeEach ->
      waitsFor ->
        require_contexts_loaded

      runs ->
        req = require.config context: 'context1'
        mod = req 'spec/fixtures/module_with_plugins'
        $171 = mod.jquery_171
        $182 = mod.jquery_182
        $182_2 = mod.jquery_182_2

    it "plugin171 should be defined", ->
      expect($171.fn["plugin171"]).toBeDefined()

    it "plugin182 should be undefined", ->
      expect($171.fn["plugin182"]).toBeUndefined()

    it "pluginGlobal should be undefined", ->
      expect($171.fn["pluginGlobal"]).toBeUndefined()

    xit "widget should be undefined", ->
      expect($171.widget).toBeUndefined()

  # describe "On the locally scoped jQuery: $182 (#{$182.fn.jquery})", ->

  #   it "plugin171 should be undefined", ->
  #     expect($182.fn["plugin171"]).toBeUndefined()

  #   it "plugin182 should be defined", ->
  #     expect($182.fn["plugin182"]).toBeDefined()

  #   it "pluginGlobal should be defined", ->
  #     expect($182.fn["pluginGlobal"]).toBeDefined()

  #   xit "widget should be defined", ->
  #     expect($182.widget).toBeDefined()

  # describe "On the second locally scoped jQuery: $182_2 (#{$182_2.fn.jquery})", ->

  #   it "plugin171 should be undefined", ->
  #     expect($182_2.fn["plugin171"]).toBeUndefined()

  #   it "plugin182 should be defined", ->
  #     expect($182_2.fn["plugin182"]).toBeDefined()

  #   it "pluginGlobal should be defined", ->
  #     expect($182_2.fn["pluginGlobal"]).toBeDefined()

  #   xit "widget should be defined", ->
  #     expect($182_2.widget).toBeDefined()
