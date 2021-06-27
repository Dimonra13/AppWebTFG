package appwebtfg

import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback

@Integration
@Rollback
class UserFeedbackControllerIntegrationSpec extends BaseControllerIntegrationSpec {

    @Autowired
    UserFeedbackController userFeedbackController

    String controllerName = "userFeedback"

    void "Validate the statistics method"() {

        setup: 'The controller action is call'
        User.withNewSession {
            userFeedbackController.statistics()
        }

        expect: 'validate the method output'
        userFeedbackController.response.status == 200
    }
}
