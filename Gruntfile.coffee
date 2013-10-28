Path = require 'path'

module.exports = (grunt)->
    module = './' + grunt.file.readJSON('package.json').main
    require(module)(grunt, __dirname)

    grunt.grunt Path.join('src', 'test')

    grunt.registerTask 'test', ['testTask']
    grunt.registerTask 'default', ['test']
