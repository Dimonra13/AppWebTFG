package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification
import spock.lang.Unroll

@Rollback
@Integration
class CourseServiceIntegrationSpec extends Specification {

    CourseService courseService

    @Unroll
    void "test the findCoursesByTitle method"(String title, int offset, int size) {

        given: "There are 16 courses in the database"
        Course.withNewSession {
            //Save test course
            if (!Course.findByTitle('pruebaFindCourse')) {
                for (int i = 0; i < 15; i++) {
                    new Course(title: 'testFindCourse' + i, category: 'test').save()
                }
                new Course(title: 'pruebaFindCourse', category: 'prueba').save()
            }
        }
        when: "FindCourseByTitle method is called"
        List<Course> output = courseService.findCoursesByTitle(title, 10, offset)
        then: "The output list must have the specified size"
        output.size() == size

        cleanup:
        Course.withNewSession { session ->
            for (int i = 0; i < 15; i++) {
                Course.findByTitle("testFindCourse" + i).delete()
            }
            Course.findByTitle("pruebaFindCourse").delete()
        }

        where:
        title              | offset | size
        "testFindCourse"   | 0      | 10
        "testFindCourse"   | 10     | 5
        "pruebaFindCourse" | 0      | 1
        "none"             | 0      | 0
    }

    @Unroll
    void "test the findCourses method pagination"(String category, int offset, int size) {

        given: "There are 16 courses in the database"
        Course.withNewSession {
            //Save test course
            if (!Course.findByTitle('pruebaFindCourse')) {
                for (int i = 0; i < 15; i++) {
                    new Course(title: 'testFindCourse' + i, category: 'test').save()
                }
                new Course(title: 'pruebaFindCourse', category: 'prueba').save()
            }
        }
        when: "FindCourses method is called"
        List<Course> output = courseService.findCourses(category, 10, offset, null, false, false, null, false, null)
        then: "The output list must have the specified size"
        output?.size() == size

        cleanup:
        Course.withNewSession { session ->
            for (int i = 0; i < 15; i++) {
                Course.findByTitle("testFindCourse" + i).delete()
            }
            Course.findByTitle("pruebaFindCourse").delete()
        }

        where:
        category | offset | size
        "test"   | 0      | 10
        "test"   | 10     | 5
        "prueba" | 0      | 1
        "none"   | 0      | 0
    }

    @Unroll
    void "test the findCourses method filter by title"(String category, String title, int size) {

        given: "There are 5 courses in the database"
        Course.withNewSession {
            //Save test course
            if (!Course.findByTitle('testFindCourseTitle1')) {
                new Course(title: 'testFindCourseTitle1', category: 'testFindCourseTitle').save()
                new Course(title: 'testFindCourseTitle2', category: 'testFindCourseTitle').save()
                new Course(title: 'testFindCourseTitle3', category: 'testFindCourseTitle').save()
                new Course(title: 'pruebaFindCourseTitle1', category: 'testFindCourseTitle').save()
                new Course(title: 'pruebaFindCourseTitle2', category: 'testFindCourseTitle').save()
            }
        }
        when: "FindCourses method is called"
        List<Course> output = courseService.findCourses(category, 10, 0, title, false, false, null, false, null)
        then: "The output list must have the specified size"
        output?.size() == size

        cleanup:
        Course.withNewSession { session ->
            for (int i = 1; i < 4; i++) {
                Course.findByTitle("testFindCourseTitle" + i).delete()
            }
            for (int i = 1; i < 3; i++) {
                Course.findByTitle("pruebaFindCourseTitle" + i).delete()
            }
        }

        where:
        category              | title                    | size
        "testFindCourseTitle" | "testFindCourseTitle"    | 3
        "testFindCourseTitle" | "pruebaFindCourseTitle"  | 2
        "testFindCourseTitle" | "pruebaFindCourseTitle1" | 1
        "testFindCourseTitle" | null                     | 5
        "testFindCourseTitle" | "shouldFail"             | 0
        "none"                | "testFindCourseTitle"    | 0
    }

    @Unroll
    void "test the findCourses method filter by difficulty"(String category, String difficulty, int size) {

        given: "There are 5 courses in the database"
        Course.withNewSession {
            //Save test course
            if (!Course.findByTitle('testFindCourseDifficulty1')) {
                new Course(title: 'testFindCourseDifficulty1', category: 'testFindCourseDifficulty', difficulty: "beginner").save()
                new Course(title: 'testFindCourseDifficulty2', category: 'testFindCourseDifficulty', difficulty: "beginner").save()
                new Course(title: 'testFindCourseDifficulty3', category: 'testFindCourseDifficulty', difficulty: "intermediate").save()
                new Course(title: 'testFindCourseDifficulty4', category: 'testFindCourseDifficulty', difficulty: "intermediate").save()
                new Course(title: 'testFindCourseDifficulty5', category: 'testFindCourseDifficulty', difficulty: "advance").save()
            }
        }
        when: "FindCourses method is called"
        List<Course> output = courseService.findCourses(category, 10, 0, null, false, false, null, false, difficulty)
        then: "The output list must have the specified size"
        output?.size() == size

        cleanup:
        Course.withNewSession { session ->
            for (int i = 1; i < 6; i++) {
                Course.findByTitle("testFindCourseDifficulty" + i).delete()
            }
        }

        where:
        category                   | difficulty     | size
        "testFindCourseDifficulty" | "beginner"     | 2
        "testFindCourseDifficulty" | "intermediate" | 2
        "testFindCourseDifficulty" | "advance"      | 1
        "testFindCourseDifficulty" | null           | 5
        "testFindCourseDifficulty" | "shouldFail"   | 0
        "none"                     | "beginner"     | 0
    }

    @Unroll
    void "test the findCourses method free courses only filter"(String category, boolean freeOnly, int size) {

        given: "There are 7 courses in the database"
        Course.withNewSession {
            //Save test course
            if (!Course.findByTitle('testFindCourseFreeOnly1')) {
                new Course(title: 'testFindCourseFreeOnly1', category: 'testFindCourseFreeOnly', isFree: 0).save()
                new Course(title: 'testFindCourseFreeOnly2', category: 'testFindCourseFreeOnly', isFree: 0).save()
                new Course(title: 'testFindCourseFreeOnly3', category: 'testFindCourseFreeOnly', isFree: 1).save()
                new Course(title: 'testFindCourseFreeOnly4', category: 'testFindCourseFreeOnly', isFree: 1).save()
                new Course(title: 'testFindCourseFreeOnly5', category: 'testFindCourseFreeOnly', isFree: 2).save()
                new Course(title: 'testFindCourseFreeOnly6', category: 'testFindCourseFreeOnly', isFree: 2).save()
                new Course(title: 'testFindCourseFreeOnly7', category: 'testFindCourseFreeOnly', isFree: 3).save()
            }
        }
        when: "FindCourses method is called"
        List<Course> output = courseService.findCourses(category, 10, 0, null, freeOnly, false, null, false, null)
        then: "The output list must have the specified size"
        output?.size() == size

        cleanup:
        Course.withNewSession { session ->
            for (int i = 1; i < 8; i++) {
                Course.findByTitle("testFindCourseFreeOnly" + i).delete()
            }
        }

        where:
        category                 | freeOnly | size
        "testFindCourseFreeOnly" | true     | 4
        "testFindCourseFreeOnly" | false    | 7
        "none"                   | true     | 0
        "none"                   | false    | 0
    }

    @Unroll
    void "test the findCourses method english courses only filter"(String category, boolean englishOnly, int size) {

        given: "There are 6 courses in the database"
        Course.withNewSession {
            //Save test course
            if (!Course.findByTitle('testFindCourseEnglishOnly1')) {
                new Course(title: 'testFindCourseEnglishOnly1', category: 'testFindCourseEnglishOnly', language: "English").save()
                new Course(title: 'testFindCourseEnglishOnly2', category: 'testFindCourseEnglishOnly', language: "English").save()
                new Course(title: 'testFindCourseEnglishOnly3', category: 'testFindCourseEnglishOnly', language: "english").save()
                new Course(title: 'testFindCourseEnglishOnly4', category: 'testFindCourseEnglishOnly', language: "Arabic").save()
                new Course(title: 'testFindCourseEnglishOnly5', category: 'testFindCourseEnglishOnly', language: "Spanish").save()
                new Course(title: 'testFindCourseEnglishOnly6', category: 'testFindCourseEnglishOnly', language: "Dual").save()
            }
        }
        when: "FindCourses method is called"
        List<Course> output = courseService.findCourses(category, 10, 0, null, false, englishOnly, null, false, null)
        then: "The output list must have the specified size"
        output?.size() == size

        cleanup:
        Course.withNewSession { session ->
            for (int i = 1; i < 7; i++) {
                Course.findByTitle("testFindCourseEnglishOnly" + i).delete()
            }
        }

        where:
        category                    | englishOnly | size
        "testFindCourseEnglishOnly" | true        | 3
        "testFindCourseEnglishOnly" | false       | 6
        "none"                      | true        | 0
        "none"                      | false       | 0
    }

    @Unroll
    void "test the findCourses method order by"(String category, String sortBy, boolean sortByAsc) {

        given: "There are 6 courses in the database"
        List<Course> testList = new LinkedList<>()
        Course.withNewSession {
            //Save test course
            testList.add(new Course(title: 'testFindCourseOrderBy1', category: 'testFindCourseOrderBy', rating: 4))
            testList.add(new Course(title: 'testFindCourseOrderBy2', category: 'testFindCourseOrderBy', rating: 4.1))
            testList.add(new Course(title: 'testFindCourseOrderBy3', category: 'testFindCourseOrderBy', rating: 4.6))
            testList.add(new Course(title: 'testFindCourseOrderBy4', category: 'testFindCourseOrderBy', rating: 4.8))
            testList.add(new Course(title: 'testFindCourseOrderBy5', category: 'testFindCourseOrderBy', rating: 4.4))
            testList.add(new Course(title: 'testFindCourseOrderBy6', category: 'testFindCourseOrderBy', rating: 4.5))
            if (!Course.findByTitle('testFindCourseOrderBy1')) {
                testList.each {course -> course.save()}
            }
        }
        and: "The expect result of the method"
        List<String> expectedResult = category == 'testFindCourseOrderBy' ?
                                        sortBy == 'title' ?
                                            sortByAsc ?
                                                    testList.sort { course1, course2 -> (course1.title <=> course2.title) }.collect{course -> course.title}
                                            : testList.sort { course1, course2 -> (course1.title <=> course2.title) }.reverse().collect{course -> course.title}
                                        : testList.sort { course1, course2 -> (course1.rating <=> course2.rating) }.reverse().collect{course -> course.title}
                                     : []

        when: "FindCourses method is called"
        List<Course> output = courseService.findCourses(category, 10, 0, null, false, false, sortBy, sortByAsc, null)

        then: "The output list must be equal to the expected list"
        output.collect{course -> course.title} == expectedResult

        cleanup:
        Course.withNewSession { session ->
            for (int i = 1; i < 7; i++) {
                Course.findByTitle("testFindCourseOrderBy" + i).delete()
            }
        }

        where:
        category                | sortBy   | sortByAsc
        "testFindCourseOrderBy" | 'title'  | true
        "testFindCourseOrderBy" | 'title'  | false
        "testFindCourseOrderBy" | 'rating' | false
        "none"                  | 'title'  | true
        "none"                  | 'title'  | false
        "none"                  | 'rating' | false
    }
}
