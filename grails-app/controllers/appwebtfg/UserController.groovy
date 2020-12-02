package appwebtfg

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.beans.factory.annotation.Autowired

@Secured(["permitAll"])
class UserController {

    RegistrationService registrationService

    def index() {
    }


    def register() {
        render(view: 'register')
    }

    def registerUser() {
        if (User.findByUsername(params?.username)) {
            render(view: 'register')
        } else {
            registrationService.registerUser(params?.username, params?.password, params?.email)
            //AutoLogin
        }

    }
}
