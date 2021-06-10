package appwebtfg


import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class SearchController {

    UserService userService

    def user(){
    }

    def searchUser(){
        String userData = params.get("userData")
        List<User> foundUsers = null
        if(userData && userData!="")
            foundUsers = userService.findUsers(userData,userData)
        render(view: "user", model: [foundUsers: foundUsers,search: true])
    }
}
