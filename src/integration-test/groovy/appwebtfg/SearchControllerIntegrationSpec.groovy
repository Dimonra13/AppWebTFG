package appwebtfg

import grails.gsp.PageRenderer
import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback

@Integration
@Rollback
class SearchControllerIntegrationSpec extends BaseControllerIntegrationSpec {
    @Autowired
    SearchController searchController

    PageRenderer groovyPageRenderer

    String controllerName = "search"

    void "Validate the searchUser method"() {

        setup: 'The controller action is call'
        searchController.searchUser()

        expect: 'validate the method output'
        searchController.response.status == 200
    }

    void "Validate the user method"() {

        setup: 'The controller action is call'
        searchController.user()

        expect: 'validate the method output'
        searchController.response.status == 200
    }
}
