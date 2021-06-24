package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification
import spock.lang.Unroll

@Rollback
@Integration
class UserFeedbackServiceIntegrationSpec extends Specification {

    RegistrationService registrationService
    UserFeedbackService userFeedbackService

    void "test the createUserFeedback method"() {

        given: "The test user"
        User testUser

        and: "There is one user registered in the database"
        testUser = User.findByUsername("testCreateUserFeedback")
        if (!testUser)
            testUser = registrationService.registerUser("testCreateUserFeedback", "test", "test@gmail.com")

        when: "The UserFeedback is created"
        UserFeedback expectedUserFeedback = userFeedbackService.createUserFeedback(testUser)

        then: "The output must be the same as the expected output of the method"
        testUser?.feedback == expectedUserFeedback

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("testCreateUserFeedback")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }
    }

    @Unroll
    void "test the updateClicks method"(String recommendation) {

        given: "The test user"
        User testUser

        and: "There is one user registered in the database"
        testUser = User.findByUsername("testUpdateClicks")
        if (!testUser)
            testUser = registrationService.registerUser("testUpdateClicks", "test", "test@gmail.com")

        and: "The UserFeedback is created"
        userFeedbackService.createUserFeedback(testUser)

        when: "The clicks are updated"
        UserFeedback expectedFeedback = userFeedbackService.updateClicks(testUser, recommendation)

        then: "The output must be the same as the expected output of the method"
        (testUser?.feedback.clicksSearch == expectedFeedback.clicksSearch) &&
                (testUser?.feedback.clicksRelatedToCourse == expectedFeedback.clicksRelatedToCourse) &&
                (testUser?.feedback.clicksRelatedToQuery == expectedFeedback.clicksRelatedToQuery) &&
                (testUser?.feedback.clicksRecommend == expectedFeedback.clicksRecommend)

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("testUpdateClicks")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        recommendation   | _
        "forUser"        | _
        "relatedQuery"   | _
        "semanticSearch" | _
        "relatedCourse"  | _
    }
}
