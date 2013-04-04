module.exports = (grunt) ->
  'use strict'
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    connect:
      test:
        options:
          keepalive: true
          port: 9000
          base: '.'

      ref_app:
        options:
          keepalive: true
          port: 9000
          base: 'ref_app'

    jasmine:
      src: 'spec/main.js'
      options:
        specs: 'spec/**/*_spec.js'
        helpers: 'http://ajax.googleapis.com/ajax/libs/jquery/1.6.3/jquery.min.js'
        template: require('grunt-template-jasmine-requirejs')

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

    copy:
      files:
        src: './getJQuery.js'
        dest: '../Galileo/auth-platform/auth-platform-webapp/vendor/assets/javascripts/modules/getJQuery.js'

    watch:
      app:
        files: ['**/*.coffee', '**/*.haml']
        tasks: ['coffee', 'haml', 'jasmine::build']

    clean:
      src: ['.grunt', '_SpecRunner.html', './getJQuery.js', 'spec', 'ref_app']

  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-haml'

  grunt.registerTask 'compile', ['clean', 'coffee', 'haml', 'jasmine::build']
  grunt.registerTask 'test', ['compile','jasmine']
  grunt.registerTask 'default', ['test']