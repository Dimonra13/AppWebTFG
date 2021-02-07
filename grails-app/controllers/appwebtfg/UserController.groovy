package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured


class UserController {

    RegistrationService registrationService
    SpringSecurityService springSecurityService
    UserService userService
    def index() {
    }

    @Secured(["permitAll"])
    def register() {
        render(view: 'register')
    }

    @Secured(["permitAll"])
    def registerUser() {
        User registered = User.findByUsername(params?.username)
        //Incorrect user input: The username is already in use or password and confirmPassword are different
        if (registered || params?.password!=params?.confirmPassword) {
            render(view: 'register', model:[username:params?.username, email: params?.email, isregistered:registered,diferentPass:(params?.password!=params?.confirmPassword)])
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

    @Secured('isAuthenticated()')
    def myProfile(){
        User authUser = springSecurityService.getCurrentUser() as User
        render(view:'myProfile', model: [user:authUser])
    }

    @Secured('isAuthenticated()')
    def editProfile(){
        User authUser = springSecurityService.getCurrentUser() as User
        render(view:'editProfile', model: [user:authUser])
    }

    @Secured('isAuthenticated()')
    def edit(){
        User registered = User.findByUsername(params?.username)
        User authUser = springSecurityService.getCurrentUser()
        User updateUser = new User(params)
        /*
          Incorrect user input: The new username is already in use or the password has been changed but
          password and confirmPassword are different.
         */
        if (((authUser.username != params?.username) && registered)
                || (params?.password && (params?.password!=params?.confirmPassword))) {
            render(view: 'editProfile', model:[user: updateUser, isregistered:registered,diferentPass:(params?.password!=params?.confirmPassword)])
        } else {
            User updatedUser = userService.updateUser(updateUser, authUser, params?.password as boolean)
            if(updatedUser){
                springSecurityService.reauthenticate(updatedUser.username)
                redirect(action: "myProfile")
            }else{
                render(view: 'editProfile', model:[user: updateUser])
            }
        }
    }
}
