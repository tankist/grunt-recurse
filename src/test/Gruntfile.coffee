module.exports = (grunt)->
    grunt.Config =
        testMulti:
            base:
                foo: 'bar'

    grunt.registerTask 'testTask', ['testMulti:base']

    grunt.registerMultiTask 'testMulti', 'Demonstrate grunt-recurse grunt.Config assigns correctly.', ->
        if this.data.foo isnt 'bar'
            throw 'Config data not received.'
