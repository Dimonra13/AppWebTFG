package appwebtfg

import grails.gsp.PageRenderer
import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback

@Integration
@Rollback
class HomeControllerIntegrationSpec extends BaseControllerIntegrationSpec {

    @Autowired
    HomeController homeController

    PageRenderer groovyPageRenderer

    String controllerName = "home"

    void "Validate the index method"() {

        setup: 'The controller action is call'
        homeController.index()

        expect: 'validate the method output'
        homeController.response.status == 200
        homeController.response.text == groovyPageRenderer.render(view: "index")
    }
}
