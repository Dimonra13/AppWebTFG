package appwebtfg

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification
import spock.lang.Unroll

class SkillSpec extends Specification implements DomainUnitTest<Skill> {

    @Unroll
    def "validate a Skill object"() {
        given: 'a new skill with params'
        Skill skill = new Skill(params)
        expect: 'validate the object'
        skill.validate() == validateRef
        where: 'params are...'
        params                          | validateRef
        [:]                             | false
        [name: 'test']                  | false
        [name: 'test', level: 'test']   | false
        [name: 'test', level: 'basic']  | true
        [name: 'test', level: 'medium'] | true
        [name: 'test', level: 'expert'] | true
        [level: 'basic']                | false
        [level: 'medium']               | false
        [level: 'expert']               | false
    }
}
