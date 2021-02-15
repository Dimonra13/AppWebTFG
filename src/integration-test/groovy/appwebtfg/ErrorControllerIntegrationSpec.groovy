package appwebtfg

import grails.gsp.PageRenderer
import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback

@Integration
@Rollback
class ErrorControllerIntegrationSpec extends BaseControllerIntegrationSpec {
    @Autowired
    ErrorController errorController

    PageRenderer groovyPageRenderer

    String controllerName = "error"

    void "Validate the notFound method"() {

        setup: 'The controller action is call'
        errorController.notFound()

        expect: 'validate the method output'
        errorController.response.status == 200
        errorController.response.text == groovyPageRenderer.render(view: "notFound")
    }

    void "Validate the notAllowed method"() {

        setup: 'The controller action is call'
        errorController.notAllowed()

        expect: 'validate the method output'
        errorController.response.status == 200
        errorController.response.text == groovyPageRenderer.render(view: "notAllowed")
    }
}
