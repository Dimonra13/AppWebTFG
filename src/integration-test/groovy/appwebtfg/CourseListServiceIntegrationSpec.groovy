package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification
import spock.lang.Unroll

@Rollback
@Integration
class CourseListServiceIntegrationSpec extends Specification {

    CourseListService courseListService
    RegistrationService registrationService

    @Unroll
    void "test the createCourseList method"(String name, String description, boolean correct) {

        given: "The expected CourseList, the test CourseList and the test user"
        User testUser
        CourseList expectedCourseList
        CourseList testCourseList

        when: "There is one user registered in the database"
        testUser = User.findByUsername("testCourseList")
        if (!testUser)
            testUser = registrationService.registerUser("testCourseList", "test", "test@gmail.com")

        and: "The expected CourseList is specified"
        expectedCourseList = correct ? new CourseList(name: name, description: description, owner: testUser) : null

        and: "The CourseList is created"
        testCourseList = courseListService.createCourseList(testUser, name, description)
        then: "The output must be the same as the expected output of the method"
        expectedCourseList?.name == testCourseList?.name

        cleanup:
        User.withNewSession { session ->
            CourseList cl = CourseList.findByName(name)
            User registeredUser = User.findByUsername("testCourseList")
            if (cl) {
                registeredUser.removeFromLists(cl)
                cl.delete()
            }
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        name    | description       | correct
        "test"  | null              | true
        "test"  | "testdescription" | true
        "diego" | null              | true
        null    | null              | false
        null    | "testDescription" | false

    }

    @Unroll
    void "test the deleteCourseList method"(String name) {

        given: "the test CourseList and the test user"
        User testUser
        CourseList testCourseList

        when: "There is one user registered in the database"
        testUser = User.findByUsername("testCourseListDelete")
        if (!testUser)
            testUser = registrationService.registerUser("testCourseListDelete", "test", "test@gmail.com")

        and: "The test courseList is added to the test user"
        testCourseList = courseListService.createCourseList(testUser, name, null)

        and: "The test courseList is deleted"
        courseListService.deleteCourseList(testUser, testCourseList?.id)

        then: "The output must be the same as the expected output of the method"
        !testUser?.lists?.any {CourseList it -> it.id == testCourseList?.id } || !name


        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("testCourseListDelete")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        name    | _
        "test"  | _
        "test"  | _
        "diego" | _
        null    | _

    }
}
