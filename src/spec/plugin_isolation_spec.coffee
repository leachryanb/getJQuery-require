define ['./plugin_isolation'], ->
  describe 'getJQuery! loader isolates jQuery plugins within a context', ->

    describe "on the window $(#{$.fn.jquery})", ->
      it 'plugin171 should be undefined', ->
        expect($.fn['plugin171']).toBeUndefined()

      it 'plugin182 should be undefined', ->
        expect($.fn['plugin182']).toBeUndefined()

      describe '(because it was required in a module without getJQuery)', ->

        it 'pluginGlobal should be defined', ->
          expect($.fn['pluginGlobal']).toBeDefined()

    describe 'on modules in the default context', ->
      $171 = $182 = $182_2 = null

      beforeEach ->
        waitsFor ->
          window.require_contexts_loaded

        runs ->
          req = require.config context: '_'
          mod = req 'spec/fixtures/module'
          $171 = mod.jquery_171
          $182 = mod.jquery_182

      describe 'for $171', ->

        it 'plugin171 should be undefined', ->
          expect($171.fn['plugin171']).toBeUndefined()

        it 'plugin182 should be undefined', ->
          expect($171.fn['plugin182']).toBeUndefined()

        it 'pluginGlobal should be undefined', ->
          expect($171.fn['pluginGlobal']).toBeUndefined()

      describe 'for $182', ->

        it 'plugin171 should be undefined', ->
          expect($182.fn['plugin171']).toBeUndefined()

        it 'plugin182 should be undefined', ->
          expect($182.fn['plugin182']).toBeUndefined()

        it 'pluginGlobal should be undefined', ->
          expect($182.fn['pluginGlobal']).toBeUndefined()

    describe 'on modules in context1', ->
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

      describe 'for $171', ->

        it 'plugin171 should be defined', ->
          expect($171.fn['plugin171']).toBeDefined()

        it 'plugin182 should be undefined', ->
          expect($171.fn['plugin182']).toBeUndefined()

        it 'pluginGlobal should be undefined', ->
          expect($171.fn['pluginGlobal']).toBeUndefined()

      describe 'for $182', ->

        it 'plugin182 should be defined', ->
          expect($182.fn['plugin182']).toBeDefined()

        it 'plugin171 should be undefined', ->
          expect($182.fn['plugin171']).toBeUndefined()

        it 'pluginGlobal should be undefined', ->
          expect($182.fn['pluginGlobal']).toBeUndefined()

    describe 'on modules in context2', ->
      $171 = $182 = $182_2 = null

      beforeEach ->
        waitsFor ->
          require_contexts_loaded

        runs ->
          req = require.config context: 'context2'
          mod = req 'spec/fixtures/module_with_plugins'
          $171 = mod.jquery_171
          $182 = mod.jquery_182
          $182_2 = mod.jquery_182_2

      describe 'for $171', ->

        it 'plugin171 should be defined', ->
          expect($171.fn['plugin171']).toBeDefined()

        it 'plugin182 should be undefined', ->
          expect($171.fn['plugin182']).toBeUndefined()

        it 'pluginGlobal should be undefined', ->
          expect($171.fn['pluginGlobal']).toBeUndefined()

      describe 'for $182', ->

        it 'plugin182 should be defined', ->
          expect($182.fn['plugin182']).toBeDefined()

        it 'plugin171 should be undefined', ->
          expect($182.fn['plugin171']).toBeUndefined()

        it 'pluginGlobal should be undefined', ->
          expect($182.fn['pluginGlobal']).toBeUndefined()

