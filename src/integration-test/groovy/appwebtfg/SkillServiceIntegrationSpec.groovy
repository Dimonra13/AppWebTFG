package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification
import spock.lang.Unroll

@Rollback
@Integration
class SkillServiceIntegrationSpec extends Specification {

    RegistrationService registrationService
    SkillService skillService;

    @Unroll
    void "test the updateBasicSkill method"(List<String> basicSkills) {

        given: "The test user"
        User testUser

        when: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            testUser = registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The test user's basicSkills are updated"
        testUser = skillService.updateBasicSkills(testUser, basicSkills)

        then: "The test user's skills must be updated correctly"
        (testUser.basicSkillsToString().split(",").size() == basicSkills.size()) ||
                (basicSkills.isEmpty() && (testUser.basicSkillsToString() == ""))

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where: 'params are...'
        basicSkills                | _
        []                         | _
        ['test']                   | _
        ['test', 'test2']          | _
        ['test', 'test2', 'test3'] | _
    }

    @Unroll
    void "test the updateMediumSkill method"(List<String> mediumSkills) {

        given: "The test user"
        User testUser

        when: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            testUser = registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The test user's mediumSkills are updated"
        testUser = skillService.updateMediumSkills(testUser, mediumSkills)

        then: "The test user's skills must be updated correctly"
        (testUser.mediumSkillsToString().split(",").size() == mediumSkills.size()) ||
                (mediumSkills.isEmpty() && (testUser.mediumSkillsToString() == ""))

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where: 'params are...'
        mediumSkills               | _
        []                         | _
        ['test']                   | _
        ['test', 'test2']          | _
        ['test', 'test2', 'test3'] | _
    }

    @Unroll
    void "test the updateExpertSkill method"(List<String> expertSkills) {

        given: "The test user"
        User testUser

        when: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            testUser = registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The test user's expertSkills are updated"
        testUser = skillService.updateExpertSkills(testUser, expertSkills)

        then: "The test user's skills must be updated correctly"
        (testUser.expertSkillsToString().split(",").size() == expertSkills.size()) ||
                (expertSkills.isEmpty() && (testUser.expertSkillsToString() == ""))

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where: 'params are...'
        expertSkills               | _
        []                         | _
        ['test']                   | _
        ['test', 'test2']          | _
        ['test', 'test2', 'test3'] | _
    }
}
