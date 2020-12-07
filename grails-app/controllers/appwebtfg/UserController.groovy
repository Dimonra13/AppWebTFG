package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class UserController {

    RegistrationService registrationService
    SpringSecurityService springSecurityService

    def index() {
    }


    def register() {
        render(view: 'register')
    }

    def registerUser() {
        User registered = User.findByUsername(params?.username)
        if (registered || params?.password!=params?.confirmPassword) {
            render(view: 'register', model:[isregistered:registered,diferentPass:(params?.password!=params?.confirmPassword)])
        } else {
            User newUser = registrationService.registerUser(params?.username, params?.password, params?.email)
            if(newUser){
                springSecurityService.reauthenticate(newUser.username)
                render(view: '/home/index')
            }else{
                render(view: 'register')
            }
        }
    }
}
