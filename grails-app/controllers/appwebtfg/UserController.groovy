package appwebtfg

import appwebtfg.cmd.ImageCommandObject
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
        if (registered || params?.password != params?.confirmPassword) {
            render(view: 'register', model: [username: params?.username, email: params?.email, isregistered: registered, diferentPass: (params?.password != params?.confirmPassword)])
        } else {
            User newUser = registrationService.registerUser(params?.username, params?.password, params?.email)
            if (newUser) {
                springSecurityService.reauthenticate(newUser.username)
                render(view: '/home/index')
            } else {
                render(view: 'register')
            }
        }
    }

    @Secured(["permitAll"])
    def getPublicProfile(Long id){
        User user = User.get(id)
        if(user)
            render(view: "myProfile", model: [user: user, isregistered: false])
        else
            render status: 404
    }

    @Secured('isAuthenticated()')
    def myProfile() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'myProfile', model: [user: authUser, isregistered: true])
    }


    @Secured('isAuthenticated()')
    def editProfile() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'editProfile', model: [user: authUser])
    }

    @Secured('isAuthenticated()')
    def edit() {
        User registered = User.findByUsername(params?.username)
        User authUser = springSecurityService.getCurrentUser()
        User updateUser = new User(params)
        /*
          Incorrect user input: The new username is already in use or the password has been changed but
          password and confirmPassword are different.
         */
        if (((authUser.username != params?.username) && registered)
                || (params?.password && (params?.password != params?.confirmPassword))) {
            render(view: 'editProfile', model: [user: updateUser, isregistered: ((authUser.username != params?.username) && registered), diferentPass: (params?.password != params?.confirmPassword)])
        } else {
            User updatedUser = userService.updateUser(updateUser, authUser, params?.password as boolean)
            if (updatedUser) {
                springSecurityService.reauthenticate(updatedUser.username)
                redirect(action: "myProfile")
            } else {
                render(view: 'editProfile', model: [user: updateUser])
            }
        }
    }

    @Secured('isAuthenticated()')
    def editProfileImage() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'editProfileImage', model: [user: authUser])
    }

    @Secured('isAuthenticated()')
    def updateProfileImage(ImageCommandObject cmd) {
        User authUser = springSecurityService.getCurrentUser() as User
        if(cmd.featuredImageFile.size==0){
            render(view: 'editProfileImage', model: [user: authUser, errorNoImage: true])
        //cmd.ownerId != authUser.id is used to prevent other users from modifying the image of the logged in user
        } else if (!cmd || cmd.ownerId != authUser.id || cmd.hasErrors()) {
            render(view: 'editProfileImage', model: [user: authUser, error: true])
        } else {
            User updatedUser = userService.updateProfileImage(authUser, cmd)
            if (updatedUser) {
                springSecurityService.reauthenticate(updatedUser.username)
                redirect(action: "myProfile")
            } else {
                render(view: 'editProfileImage', model: [user: authUser, error: true])
            }
        }
    }

    @Secured('isAuthenticated()')
    def deleteProfileImage() {
        User authUser = springSecurityService.getCurrentUser() as User
        userService.deleteProfileImage(authUser)
        redirect(action: 'myProfile')
    }

    @Secured(["permitAll"])
    def renderProfileImage(Long id) {
        User owner = User.get(id)
        if (owner && owner.hasProfileImage)
            render file: owner.profileImageBytes, contentType: owner.profileImageContentType
    }
}
