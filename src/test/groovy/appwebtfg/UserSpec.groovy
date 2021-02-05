package appwebtfg

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification
import spock.lang.Unroll

class UserSpec extends Specification implements DomainUnitTest<User> {

    @Unroll
    def "validate a User object"() {
        given: 'a new user with params'
        User user = new User(params)
        expect: 'validate the object'
        user.validate() == validateRef
        where: 'params are...'
        params                                                                                         | validateRef
        [:]                                                                                            | false
        [email: 'test@gmail.com', password: 'password', username: 'Test']                              | true
        [email: 'testgmail.com', password: 'password', username: 'Test']                               | false
        [email: 'test@gmail.com', username: 'Diego']                                                   | false
        [email: 'test@gmail.com', password: 'pass']                                                    | false
        [email: 'test@gmail.com', password: 'password', username: 'Test', phoneNumber: '123456789']    | true
        [email: 'test@gmail.com', password: 'password', username: 'Test', phoneNumber: '123456789123'] | false
        [email: 'test@gmail.com', password: 'password', username: 'Test', phoneNumber: '1234er789']    | false
        [email: 'test@gmail.com', password: 'password', username: 'Test',
         lists: []]                                                                                    | true
        [email: 'test@gmail.com', password: 'password', username: 'Test',
         lists: [new CourseList(name: 'TestList')]]                                                    | true
        [email: 'test@gmail.com', password: 'password', username: 'Test',
         lists: [new CourseList(name: 'TestList1'), new CourseList(name: 'TestList2')]]                | true
        [email: 'test@gmail.com', password: 'password', username: 'Test',
         lists: [new CourseList(name: 'TestList', courses: [new Course(name: 'test')])]]               | true
    }
}
