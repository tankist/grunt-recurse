module.exports = (grunt)->
    grunt.Config =
        testMulti:
            base:
                foo: 'bar'
        copy:
            test:
                files:
                    'src/test/copy/b': ['src/test/copy/a']

    grunt.NpmTasks = 'grunt-contrib-copy'

    grunt.registerTask 'testTask', ['testMulti:base', 'copy:test']

    grunt.registerMultiTask 'testMulti', 'Demonstrate grunt-recurse grunt.Config assigns correctly.', ->
        if this.data.foo isnt 'bar'
            throw 'Config data not received.'
