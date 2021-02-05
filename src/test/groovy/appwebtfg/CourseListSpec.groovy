package appwebtfg

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification
import spock.lang.Unroll

class CourseListSpec extends Specification implements DomainUnitTest<CourseList> {

    @Unroll
    def "validate a CourseList object"() {
        given: 'a new CourseList with params'
        CourseList courseList = new CourseList(params)
        expect: 'validate the object'
        courseList.validate() == validateRef
        where: 'params are...'
        params                                                                                   | validateRef
        [:]                                                                                      | false
        [name: 'test',
         owner: new User(email: 'test@gmail.com', password: 'password', username: 'Test')]       | true
        [name: 'test', description: 'Example description']                                       | false
        [description: 'Example description',
         owner: new User(email: 'test@gmail.com', password: 'password', username: 'Test')]       | false
        [description: 'Example description']                                                     | false
        [name: 'test', description: 'Example description',
         owner: new User(email: 'test@gmail.com', password: 'password', username: 'Test')]       | true
        [name: 'test', description: 'Example description',
         owner: new User(email: 'test@gmail.com', password: 'password', username: 'Test'),
         courses: []]                                                                            | true
        [name: 'test', description: 'Example description',
         owner: new User(email: 'test@gmail.com', password: 'password', username: 'Test'),
         courses: [new Course(name: 'test1'), new Course(name: 'test2')]]                        | true
    }
}
