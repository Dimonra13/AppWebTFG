package appwebtfg

import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback

@Integration
@Rollback
class SearchControllerIntegrationSpec extends BaseControllerIntegrationSpec {
    @Autowired
    SearchController searchController

    String controllerName = "search"

    void "Validate the searchUser method"() {

        setup: 'The controller action is call'
        User.withNewSession { it ->
            searchController.searchUser()
        }

        expect: 'validate the method output'
        searchController.response.status == 200
    }

    void "Validate the user method"() {

        setup: 'The controller action is call'
        searchController.user()

        expect: 'validate the method output'
        searchController.response.status == 200
    }

    void "Validate the searchCourse method"() {

        setup: 'The controller action is call'
        Course.withNewSession { it ->
            searchController.searchCourse()
        }

        expect: 'validate the method output'
        searchController.response.status == 200
    }

    void "Validate the course method"() {

        setup: 'The controller action is call'
        searchController.course()

        expect: 'validate the method output'
        searchController.response.status == 200
    }
}
