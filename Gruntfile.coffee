module.exports = (grunt) ->
  'use strict'
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    jasmine:
      src: 'scripts/**/*.js'
      options:
        specs: 'spec/**/*.js'

    coffee:
      app:
        expand: true,
        cwd: 'src',
        src: ['**/*.coffee'],
        dest: 'dist',
        ext: '.js'
      spec:
        expand: true,
        cwd: 'src',
        src: ['**/*.coffee'],
        dest: 'dist',
        ext: '.js'
    watch:
      app:
        files: '**/*.coffee'
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'test', ['coffee', 'jasmine']
  grunt.registerTask 'default', ['test']