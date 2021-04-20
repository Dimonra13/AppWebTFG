package appwebtfg

import appwebtfg.cmd.ImageCommandObject
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured


class UserController {

    RegistrationService registrationService
    SpringSecurityService springSecurityService
    UserService userService
    SkillService skillService

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
                redirect(controller: "home", action: "index")
            } else {
                render(view: 'register')
            }
        }
    }

    /**
     * Method that returns the public page of the user with id=params.id if it exists or error 404 otherwise.
     * In case this user's profile is private the method will return error 403.
     * @param id
     * @return view "myProfile", status 404 or status 403
     */
    @Secured(["permitAll"])
    def getPublicProfile(Long id) {
        User user = User.get(id)
        if (user)
            if (user.isPublicProfile)
                render(view: "myProfile", model: [user: user, isregistered: false])
            else
                render status: 403
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
     *  Method used to render the profile image of the user with id=params.id if the profile is public or the user
     *  trying to render the image is its owner. In other case the method returns error 403.
     *  If the requested image doesn't exist the method returns error 404
     * @param id
     * @return the rendered profile image, status 403 or status 404
     */
    @Secured(["permitAll"])
    def renderProfileImage(Long id) {
        User owner = User.get(id)
        User authUser = springSecurityService.isLoggedIn() ? springSecurityService.getCurrentUser() : null
        if (owner && owner.hasProfileImage)
        //The profile is public or the user trying to render the image is its owner
            if (owner.isPublicProfile || owner == authUser)
                render file: owner.profileImageBytes, contentType: owner.profileImageContentType
            else
                render status: 403
        else
            render status: 404
    }

    /**
     * Method used to make the profile of the auth user public
     * @return redirect to "/user/myProfile"
     */
    @Secured('isAuthenticated()')
    def makeProfilePublic() {
        User authUser = springSecurityService.getCurrentUser()
        if (authUser && !authUser.isPublicProfile)
            userService.makeProfilePublic(authUser)
        redirect(action: "myProfile")
    }

    /**
     * Method used to make the profile of the auth user private
     * @return redirect to "/user/myProfile"
     */
    @Secured('isAuthenticated()')
    def makeProfilePrivate() {
        User authUser = springSecurityService.getCurrentUser()
        if (authUser.isPublicProfile)
            userService.makeProfilePrivate(authUser)
        redirect(action: "myProfile")
    }

    /**
     * Method that returns the page used to add interests to the authenticated user profile
     * @return view "interests"
     */
    @Secured('isAuthenticated()')
    def addInterests() {
        render(view: "interests", model: [userInterests: null])
    }

    /**
     * Method that returns the page used to edit the authenticated user interests list
     * @return view "interests"
     */
    @Secured('isAuthenticated()')
    def editInterests() {
        User authUser = springSecurityService.getCurrentUser()
        render(view: "interests", model: [userInterests: authUser?.interests])
    }

    /**
     * Method used to update the authenticated user interests list
     * @return redirect to "/"
     */
    @Secured('isAuthenticated()')
    def updateInterests(){
        List<String> userInterests = params.get("categories[]")
        User authUser = springSecurityService.getCurrentUser()
        userService.updateInterests(authUser,userInterests)
        redirect(controller:  "home", action: "index")
    }

    /**
     * Method that returns the page used to add skills to the authenticated user profile
     * @return view "skills"
     */
    @Secured('isAuthenticated()')
    def addSkills() {
        render(view: "skills",model: [recommendedBS: skillService.getRecommendedBasicSkills(),
                                      recommendedMS: skillService.getRecommendedMediumSkills(),
                                      recommendedES: skillService.getRecommendedExpertSkills()])
    }

    /**
     * Method that returns the page used to edit the authenticated user skills
     * @return view "skills"
     */
    @Secured('isAuthenticated()')
    def editSkills() {
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: "skills", model: [bs: authUser?.basicSkillsToString(),
                                       ms: authUser?.mediumSkillsToString(),
                                       es: authUser?.expertSkillsToString(),
                                       recommendedBS: skillService.getRecommendedBasicSkills(),
                                       recommendedMS: skillService.getRecommendedMediumSkills(),
                                       recommendedES: skillService.getRecommendedExpertSkills(),
                                       update: true])
    }

    /**
     * Method used to update the authenticated user skills
     * @return redirect to "/"
     */
    @Secured('isAuthenticated()')
    def updateSkills() {
        User authUser = springSecurityService.getCurrentUser() as User
        List<String> basicSkills = params?.basic[1].split(",").findAll { it != "" }
        List<String> mediumSkills = params?.medium[1].split(",").findAll { it != "" }
        List<String> expertSkills = params?.expert[1].split(",").findAll { it != "" }
        skillService.updateSkills(authUser, basicSkills, mediumSkills, expertSkills)
        redirect(controller:  "home", action: "index")
    }
}
