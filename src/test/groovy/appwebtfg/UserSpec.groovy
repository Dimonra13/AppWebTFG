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
         lists: [new CourseList(name: 'TestList', courses: [new Course(title: 'test')])]]              | true
    }

    @Unroll
    def "Test basicSkillsToString method"() {
        given: 'a new user'
        User user = new User(email: 'testgmail.com', password: 'password', username: 'Test');
        and: 'a list of basic skills for the user'
        user.basicSkills = basicSkills
        expect: 'the skills in the output String of the method must be the same as the skills of the user'
        (user.basicSkillsToString().split(",").size() == basicSkills.size()) ||
                (basicSkills.isEmpty() && (user.basicSkillsToString() == ""))
        where: 'params are...'
        basicSkills                                                                         | _
        []                                                                                  | _
        [new Skill(name: 'test', level: 'basic')]                                           | _
        [new Skill(name: 'test', level: 'basic'), new Skill(name: 'test2', level: 'basic')] | _
        [new Skill(name: 'test', level: 'basic'), new Skill(name: 'test2', level: 'basic'),
         new Skill(name: 'test3', level: 'basic')]                                          | _
    }

    @Unroll
    def "Test mediumSkillsToString method"() {
        given: 'a new user'
        User user = new User(email: 'testgmail.com', password: 'password', username: 'Test');
        and: 'a list of medium skills for the user'
        user.mediumSkills = mediumSkills
        expect: 'the skills in the output String of the method must be the same as the skills of the user'
        (user.mediumSkillsToString().split(",").size() == mediumSkills.size()) ||
                (mediumSkills.isEmpty() && (user.mediumSkillsToString() == ""))
        where: 'params are...'
        mediumSkills                                                                          | _
        []                                                                                    | _
        [new Skill(name: 'test', level: 'medium')]                                            | _
        [new Skill(name: 'test', level: 'medium'), new Skill(name: 'test2', level: 'medium')] | _
        [new Skill(name: 'test', level: 'medium'), new Skill(name: 'test2', level: 'medium'),
         new Skill(name: 'test3', level: 'medium')]                                           | _
    }

    @Unroll
    def "Test expertSkillsToString method"() {
        given: 'a new user'
        User user = new User(email: 'testgmail.com', password: 'password', username: 'Test');
        and: 'a list of basic skills for the user'
        user.expertSkills = expertSkills
        expect: 'the skills in the output String of the method must be the same as the skills of the user'
        (user.expertSkillsToString().split(",").size() == expertSkills.size()) ||
                (expertSkills.isEmpty() && (user.expertSkillsToString() == ""))
        where: 'params are...'
        expertSkills                                                                          | _
        []                                                                                    | _
        [new Skill(name: 'test', level: 'expert')]                                            | _
        [new Skill(name: 'test', level: 'expert'), new Skill(name: 'test2', level: 'expert')] | _
        [new Skill(name: 'test', level: 'expert'), new Skill(name: 'test2', level: 'expert'),
         new Skill(name: 'test3', level: 'expert')]                                           | _
    }
}
