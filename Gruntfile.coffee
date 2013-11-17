Path = require 'path'

module.exports = (grunt)->
    # Load grunt-recurse from the name given in package.json main,
    # to ensure it will work when it's a node module.
    module = './' + grunt.file.readJSON('package.json').main
    require(module)(grunt, __dirname)

    # Export the current package.json
    grunt.pkg = grunt.file.readJSON('package.json')

    # Recursively load the configuration in src/test/Gruntfile.coffee
    grunt.grunt Path.join('src', 'test')

    # After all the subGrunts have been loaded, finalize the config info.
    grunt.initConfig grunt.Config

    # Load all the requested tasks from NPM, as well as all installed
    # grunt-* installed modules.
    require('load-grunt-tasks')(grunt)
    grunt.loadNpmTasks task for task in grunt.NpmTasks

    # Finally, our project's root tasks.
    grunt.registerTask 'test', ['testTask']
    grunt.registerTask 'default', ['test']
