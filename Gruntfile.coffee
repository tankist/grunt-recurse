Path = require 'path'

module.exports = (grunt)->
    module = './' + grunt.file.readJSON('package.json').main
    require(module)(grunt, __dirname)

    grunt.grunt Path.join('src', 'test')

    grunt.initConfig grunt.Config

    grunt.loadNpmTasks task for task in grunt.NpmTasks

    grunt.registerTask 'test', ['testTask']
    grunt.registerTask 'default', ['test']
