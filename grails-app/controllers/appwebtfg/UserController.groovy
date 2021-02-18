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

    /**
     * Method that returns the register page
     * @return view "register"
     */
    @Secured(["permitAll"])
    def register() {
        render(view: 'register')
    }

    /**
     * Method used to register a new user. It returns the home page if the input data is correct or the register page otherwise.
     * @param username , email, password, confirmPassword
     * @return view "/home/index" or view "/register"
     */
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

    /**
     * Method that returns the public page of the user with id=params.id if it exists or error 404 otherwise
     * @param id
     * @return view "myProfile" or status 404
     */
    @Secured(["permitAll"])
    def getPublicProfile(Long id) {
        User user = User.get(id)
        if (user)
            render(view: "myProfile", model: [user: user, isregistered: false])
        else
            render status: 404
    }

    /**
     * Method that returns the private page of the authenticated user. This private page
     * allows the authenticated user to modified his/hers personal data and to create/delete his/hers courseLists.
     * @return view "myProfile"
     */
    @Secured('isAuthenticated()')
    def myProfile() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'myProfile', model: [user: authUser, isregistered: true])
    }


    /**
     * Method that returns the page used to edit the authenticated user personal info.
     * @return view "editProfile"
     */
    @Secured('isAuthenticated()')
    def editProfile() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'editProfile', model: [user: authUser])
    }

    /**
     * Method used to edit the authenticated user personal info. In case of an error the view 'editProfile' is rendered
     * else the method redirects the user to "/user/myProfile".
     * @param username , email, password, confirmPassword, phoneNumber
     * @return redirect to "/user/myProfile" or render view "editProfile"
     */
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

    /**
     * Method that returns the page used to edit the authenticated user profile image.
     * @return view "editProfileImage"
     */
    @Secured('isAuthenticated()')
    def editProfileImage() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'editProfileImage', model: [user: authUser])
    }

    /**
     * Method used to edit the authenticated user profile image. In case of an error the view 'editProfileImage' is
     * rendered else the method redirects the user to "/user/myProfile".
     * @param cmd
     * @return redirect to "/user/myProfile" or render view "editProfile"
     */
    @Secured('isAuthenticated()')
    def updateProfileImage(ImageCommandObject cmd) {
        User authUser = springSecurityService.getCurrentUser() as User
        if (cmd.featuredImageFile.size == 0) {
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

    /**
     * Method used to delete the authenticated user profile image.
     * @return redirect to "/user/myProfile"
     */
    @Secured('isAuthenticated()')
    def deleteProfileImage() {
        User authUser = springSecurityService.getCurrentUser() as User
        userService.deleteProfileImage(authUser)
        redirect(action: 'myProfile')
    }

    /**
     *  Method used to render the profile image of the user with id=params.id
     * @param id
     * @return the rendered profile image
     */
    @Secured(["permitAll"])
    def renderProfileImage(Long id) {
        User owner = User.get(id)
        if (owner && owner.hasProfileImage)
            render file: owner.profileImageBytes, contentType: owner.profileImageContentType
    }
}
