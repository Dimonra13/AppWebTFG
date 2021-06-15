package appwebtfg

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification
import spock.lang.Unroll

class CourseSpec extends Specification implements DomainUnitTest<Course> {

    @Unroll
    def "validate a Course object"() {
        given: 'a new course with params'
        Course course = new Course(params)
        expect: 'validate the object'
        course.validate() == validateRef
        where: 'params are...'
        params                                                                                | validateRef
        [:]                                                                                   | false
        [title: 'test', description: 'Example description']                                   | false
        [description: 'Example description']                                                  | false
        [title: 'test']                                                                       | false
        [title: 'test', rating: 12.34]                                                        | false
        [title: 'test', category: null]                                                       | false
        [title: 'test', description: 'Example description', category: 'Software-Engineering'] | true
        [description: 'Example description', category: 'Software-Engineering']                | false
        [title: 'test', category: 'Software-Engineering']                                     | true
        [title: 'test', rating: 12.34, category: 'Software-Engineering']                      | true
    }

}
