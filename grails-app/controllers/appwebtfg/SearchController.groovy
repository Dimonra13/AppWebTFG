package appwebtfg


import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class SearchController {

    UserService userService

    def user() { }

    def searchUser(){
        String userData = params.get("userData")
        List<User> foundUsers = userService.findUsers(userData,null)
        render(view: "user", model: [foundUsers: foundUsers])
    }
}
