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

    /*
    TODO: FIX ME
    @Unroll
    void "test the findCoursesByCategorymethod"(String category, int offset, int size) {

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
        when: "FindCourseByCategory method is called"
        List<Course> output = courseService.findCourses(category, 10, offset)
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
    */
}
