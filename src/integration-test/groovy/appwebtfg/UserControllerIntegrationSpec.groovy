package appwebtfg

import grails.gsp.PageRenderer
import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback
import spock.lang.Unroll

@Integration
@Rollback
class UserControllerIntegrationSpec extends BaseControllerIntegrationSpec {

    @Autowired
    UserController userController

    PageRenderer groovyPageRenderer

    String controllerName = "user"

    void "Validate the create method"() {

        setup: 'The controller action is call'
        userController.register()

        expect: 'validate the method output'
        userController.response.status == 200
        userController.response.text == groovyPageRenderer.render(view: "register")
    }

    void "Validate the editProfile method"() {

        setup: 'The controller action is call'
        userController.editProfile()

        expect: 'validate the method output'
        userController.response.status == 200
        userController.response.text == groovyPageRenderer.render(view: "editProfile")
    }

    void "Validate the myProfile method"() {

        setup: 'The controller action is call'
        userController.myProfile()

        expect: 'validate the method output'
        userController.response.status == 200
        userController.response.text == groovyPageRenderer.render(view: "editProfile")
    }

    @Unroll
    void "Validate the getPublicProfile method"(int id) {

        given: "The user corresponding to the id"
        User user

        when: 'The controller action is call'
        User.withNewSession { session ->
            user = User.get(id)
            userController.getPublicProfile(id)
        }

        then: 'validate this method output'
        (user && userController.response.status == 200) || (!user &&  userController.response.status == 404)

        where:
        id | _
        1  | _
        2  | _
        8  | _
        16 | _
    }

    void "Validate the editProfileImage method"() {

        setup: 'The controller action is call'
        userController.editProfileImage()

        expect: 'validate the method output'
        userController.response.status == 200
        userController.response.text == groovyPageRenderer.render(view: "editProfileImage")
    }
}
