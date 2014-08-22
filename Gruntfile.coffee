module.exports = (grunt) ->

  # configuration
  grunt.initConfig

    # grunt sass
    sass:
      compile:
        options:
          style: 'expanded'
        files: [
          expand: true
          cwd: 'lib/sass'
          src: ['**/*.sass', '**/*.scss']
          dest: 'css'
          ext: '.css'
        ]

    # grunt coffee
    coffee:
      compile:
        expand: true
        cwd: 'lib/coffee'
        src: ['**/*.coffee']
        dest: 'js'
        ext: '.js'
        options:
          bare: true
          preserve_dirs: true

    # grunt slim
    slim:
      dist:
        files: [{
          expand: true
          cwd: 'lib/slim'
          src: ['**/*.slim']
          dest: '.'
          ext: '.html'
        }]

    # grunt watch (or simply grunt)
    watch:
      html:
        files: ['**/*.html']
      sass:
        files: ['**/*.sass']
        tasks: ['sass']
      coffee:
        files: '<%= coffee.compile.src %>'
        tasks: ['coffee']
      slim:
        files: ['**/*.slim']
        tasks: ['slim']
      options:
        livereload: true

    # grunt connect
    connect:
      server:
        options:
          open: true

  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  # tasks
  grunt.registerTask 'default', ['sass', 'coffee', 'slim', 'connect', 'watch']
