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
        "explore"        | _
    }

    @Unroll
    void "test the updateAddToList method"(String recommendation) {

        given: "The test user"
        User testUser

        and: "There is one user registered in the database"
        testUser = User.findByUsername("testUpdateAddToList")
        if (!testUser)
            testUser = registrationService.registerUser("testUpdateAddToList", "test", "test@gmail.com")

        and: "The UserFeedback is created"
        userFeedbackService.createUserFeedback(testUser)

        when: "The addToList counter are updated"
        UserFeedback expectedFeedback = userFeedbackService.updateAddToList(testUser, recommendation)

        then: "The output must be the same as the expected output of the method"
        (testUser?.feedback.addToListSearch == expectedFeedback.addToListSearch) &&
                (testUser?.feedback.addToListRelatedToCourse == expectedFeedback.addToListRelatedToCourse) &&
                (testUser?.feedback.addToListRelatedToQuery == expectedFeedback.addToListRelatedToQuery) &&
                (testUser?.feedback.addToListRecommend == expectedFeedback.addToListRecommend)

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
        "explore"        | _
    }

    @Unroll
    void "test the updateNotInterested method"(String recommendation) {

        given: "The test user"
        User testUser

        and: "There is one user registered in the database"
        testUser = User.findByUsername("testNotInterested")
        if (!testUser)
            testUser = registrationService.registerUser("testNotInterested", "test", "test@gmail.com")

        and: "The UserFeedback is created"
        userFeedbackService.createUserFeedback(testUser)

        when: "The NotInterested counter are updated"
        UserFeedback expectedFeedback = userFeedbackService.updateNotInterested(testUser, recommendation)

        then: "The output must be the same as the expected output of the method"
        (testUser?.feedback.notInterestedUdemy == expectedFeedback.notInterestedUdemy) &&
                (testUser?.feedback.notInterestedUdacity == expectedFeedback.notInterestedUdacity) &&
                (testUser?.feedback.notInterestedCoursera == expectedFeedback.notInterestedCoursera)

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("testNotInterested")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        recommendation | _
        "Udemy"        | _
        "Udacity"      | _
        "Coursera"     | _
    }
}
