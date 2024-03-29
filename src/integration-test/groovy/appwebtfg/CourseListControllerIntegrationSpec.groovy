package appwebtfg

import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback
import spock.lang.Unroll

@Integration
@Rollback
class CourseListControllerIntegrationSpec extends BaseControllerIntegrationSpec {

    @Autowired
    CourseListController courseListController

    String controllerName = "course"

    @Unroll
    void "Validate the getCourseList method"(int id) {

        given: "The courseList corresponding to the id"
        CourseList courseList

        when: 'The controller action is call'
        Course.withNewSession { session ->
            courseList = CourseList.get(id)
            courseListController.getCourseList(id)
        }

        then: 'validate the method output'
        (courseList?.owner?.isPublicProfile && courseListController.response.status == 200) ||
                (courseList && !courseList?.owner?.isPublicProfile && courseListController.response.status == 403) ||
                    (!courseList && courseListController.response.status == 404)

        where:
        id | _
        1  | _
        22 | _
        7  | _
        4  | _
    }

    @Unroll
    void "Validate the getMyCourseList method"(int id) {

        given: "The courseList corresponding to the id"
        CourseList cl

        when: 'The controller action is call'
        Course.withNewSession { session ->
            cl = CourseList.get(id)
            courseListController.getMyCourseList(id)
        }

        then: 'validate this method output'
        (cl && (courseListController.response.status == 200 || courseListController.response.status == 403)) ||
                (!cl && courseListController.response.status == 404)

        where:
        id | _
        1  | _
        2  | _
        8  | _
        16 | _
    }

    void "Validate the createCourseList method"() {

        setup: 'The controller action is call'
        courseListController.createCourseList()

        expect: 'validate the method output'
        courseListController.response.status == 200
    }
}
