Path = require 'path'

module.exports = (grunt, root)->
    grunt.grunt = (path)->
        other = require Path.join root, path, 'Gruntfile'
        other(grunt)
