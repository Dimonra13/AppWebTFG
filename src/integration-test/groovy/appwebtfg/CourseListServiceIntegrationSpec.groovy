package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
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

        and: "There is one user registered in the database"
        testUser = User.findByUsername("testCourseList")
        if (!testUser)
            testUser = registrationService.registerUser("testCourseList", "test", "test@gmail.com")

        and: "The expected CourseList is specified"
        expectedCourseList = correct ? new CourseList(name: name, description: description, owner: testUser) : null

        when: "The CourseList is created"
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

        and: "There is one user registered in the database"
        testUser = User.findByUsername("testCourseListDelete")
        if (!testUser)
            testUser = registrationService.registerUser("testCourseListDelete", "test", "test@gmail.com")

        and: "The test courseList is added to the test user"
        testCourseList = courseListService.createCourseList(testUser, name, null)

        when: "The test courseList is deleted"
        courseListService.deleteCourseList(testUser, testCourseList?.id)

        then: "The output must be the same as the expected output of the method"
        !testUser?.lists?.any { CourseList it -> it.id == testCourseList?.id } || !name


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

    @Unroll
    void "test the addCourseToList method"(String name) {
        given: "The test CourseList and the test course"
        Course testCourse
        CourseList testCourseList


        and: "There is one user registered in the database"
        User testUser = User.findByUsername("testCourseList")
        if (!testUser)
            testUser = registrationService.registerUser("testAddToCourseList", "test", "test@gmail.com")

        and: "The test CourseList and the test Course are specified"
        testCourseList = courseListService.createCourseList(testUser, 'testAddTo', 'description')
        testCourse = new Course(title: name, category: "Software-Engineering").save()

        when: "The test course is added to the test CourseList"
        testCourseList = courseListService.addCourseToList(testCourseList.id, testCourse.id)

        then: "The output must be the same as the expected output of the method"
        testCourseList?.courses?.any { it.title == name }

        where:
        name     | _
        "test"   | _
        "curso"  | _
        "prueba" | _

    }

    @Unroll
    void "test the deleteCourseFromList method"(String name) {
        given: "The test CourseList and the test course"
        Course testCourse
        CourseList testCourseList


        and: "There is one user registered in the database"
        User testUser = User.findByUsername("testCourseList")
        if (!testUser)
            testUser = registrationService.registerUser("testRemoveFromCourseList", "test", "test@gmail.com")

        and: "The test CourseList and the test Course are specified"
        testCourseList = courseListService.createCourseList(testUser, 'testRemoveTo', 'description')
        testCourse = new Course(title: name, category: "Software-Engineering").save()

        and: "The test course is added to the test CourseList"
        courseListService.addCourseToList(testCourseList.id, testCourse.id)

        when:"The test course is remove from the test CourseList"
        testCourseList =  courseListService.deleteCourseFromList(testCourseList.id, testCourse.id)

        then: "The output must be the same as the expected output of the method"
        !testCourseList?.courses?.any { it.title == name }

        where:
        name     | _
        "test"   | _
        "curso"  | _
        "prueba" | _

    }
}
