module.exports = (grunt) ->
  'use strict'
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    connect:
      test:
        options:
          port: 9000
          base: 'spec/'
      test_runner:
        options:
          keepalive: true
          port: 9001
          base: './'
      ref_app:
        options:
          keepalive: true
          port: 9002
          base: 'ref_app'

    jasmine:
      src: 'spec/main.js'
      options:
        specs: 'spec/*_spec.js'
        host: 'http://127.0.0.1:<%= connect.test.port %>/'
        template: require('grunt-template-jasmine-requirejs')
        templateOptions:
          requireConfig:
            baseUrl: "./"
            # urlArgs: "bust=" + (new Date()).getTime()
            # paths:
            #   "jquery-1.7.1": "lib/jquery-1.7.1"
            #   "jquery-1.8.2": "lib/jquery-1.8.2"

    haml:
      options:
        bare: true
      app:
        expand: true
        cwd: 'src'
        src: ['**/*.haml']
        dest: '.'
        ext: '.html'

    coffee:
      options:
        bare: true
      app:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: '.'
        ext: '.js'

    watch:
      app:
        files: ['**/*.coffee', '**/*.haml']
        tasks: ['coffee', 'haml']

    clean:
      src: ['./getJQuery.js', 'spec', 'ref_app']

  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-haml'

  grunt.registerTask 'compile', ['haml', 'coffee']
  grunt.registerTask 'test', ['compile', 'jasmine']
  grunt.registerTask 'test_runner', ['compile', 'connect:test_runner']
  grunt.registerTask 'default', ['test']