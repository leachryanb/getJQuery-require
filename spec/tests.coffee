define [
  "getJQuery!1.7.1[plugin-1.7.1.jquery]"
  "getJQuery!1.8.2[plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]"
  "getJQuery!1.8.2[plugin-global.jquery, plugin-1.8.2.jquery, lib/jquery-ui-1.9.0.custom]"
], ($171, $182, $182_2) ->

  $global = if window.$ then window.$ else fn: jquery: "undefined"

  init: (name)->

    describe "getJQuery! loader plugin for: #{name}", ->

      describe 'should load jQuery', ->

        it '$171 should be defined', ->
          expect($171).toBeDefined()

        it '$182 should be defined', ->
          expect($182).toBeDefined()

        it '$182_2 should be defined', ->
          expect($182_2).toBeDefined()

      describe 'at the right version', ->

        it '$171 should be version 1.7.1', ->
          expect($171.fn).toBeDefined()
          expect($171.fn.jquery).toEqual('1.7.1')

        it '$182 should be version 1.8.2', ->
          expect($182.fn).toBeDefined()
          expect($182.fn.jquery).toEqual('1.8.2')

        it '$182_2 should be version 1.8.2', ->
          expect($182_2.fn).toBeDefined()
          expect($182_2.fn.jquery).toEqual('1.8.2')

      describe 'without affecting the global jQuery', ->

        it '$global should be version 1.6.3', ->
          expect($global.fn.jquery).toEqual('1.6.3')

      # describe "On the window scope (#{$global.fn.jquery})", ->

      #   it 'plugin171 should be undefined', ->
      #     expect($global.fn["plugin171"]).toBeUndefined();

      #   it 'plugin182 should be undefined', ->
      #     expect($global.fn["plugin182"]).toBeUndefined();

      # describe "On the locally scoped jQuery: $171 (#{$171.fn.jquery})", ->

      #   it "plugin171 should be defined", ->
      #     expect($171.fn["plugin171"]).toBeDefined();

      #   it "plugin182 should be undefined", ->
      #     expect($171.fn["plugin182"]).toBeUndefined();

      #   it "pluginGlobal should be undefined", ->
      #     expect($171.fn["pluginGlobal"]).toBeUndefined();

      #   it "widget should be undefined", ->
      #     expect($171.widget).toBeUndefined();

      # describe "On the locally scoped jQuery: $182 (#{$182.fn.jquery})", ->

      #   it "plugin171 should be undefined", ->
      #     expect($182.fn["plugin171"]).toBeUndefined();

      #   it "plugin182 should be defined", ->
      #     expect($182.fn["plugin182"]).toBeDefined();

      #   it "pluginGlobal should be defined", ->
      #     expect($182.fn["pluginGlobal"]).toBeDefined();

      #   it "widget should be defined", ->
      #     expect($182.widget).toBeDefined();

      # describe "On the second locally scoped jQuery: $182_2 (#{$182_2.fn.jquery})", ->

      #   it "plugin171 should be undefined", ->
      #     expect($182_2.fn["plugin171"]).toBeUndefined();

      #   it "plugin182 should be defined", ->
      #     expect($182_2.fn["plugin182"]).toBeDefined();

      #   it "pluginGlobal should be defined", ->
      #     expect($182_2.fn["pluginGlobal"]).toBeDefined();

      #   it "widget should be defined", ->
      #     expect($182_2.widget).toBeDefined();
