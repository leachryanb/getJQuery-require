define [], ->
  delete_em = [
    'getJQuery!'
    'text!'
    'jquery-'
    '-jquery'
  ]

  reset: ->
    for contextName, context of requirejs.s.contexts
      for moduleId, module of context.defined
        for stub in delete_em
          console.log moduleId if moduleId.indexOf(stub) >=0
          context.require.undef moduleId if moduleId.indexOf(stub) >=0


    window.require_contexts_loaded = false

