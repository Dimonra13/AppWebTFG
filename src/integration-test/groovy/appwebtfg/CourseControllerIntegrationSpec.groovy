package appwebtfg

import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback
import spock.lang.Unroll

@Integration
@Rollback
class CourseControllerIntegrationSpec extends BaseControllerIntegrationSpec {

    @Autowired
    CourseController courseController

    String controllerName = "course"

    @Unroll
    void "Validate the getCourse method"(int id) {

        given: "The course corresponding to the id"
        Course course

        when: 'The controller action is call'
        Course.withNewSession { session ->
            course = Course.get(id)
            courseController.getCourse(id)
        }

        then: 'validate the method output'
        (course && courseController.response.status == 200) || (!course && courseController.response.status == 404)

        where:
        id          | _
        1           | _
        2           | _
        3           | _
        4           | _
        12000000000 | _
    }
}
