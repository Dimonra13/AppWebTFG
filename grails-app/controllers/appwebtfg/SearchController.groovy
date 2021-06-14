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
        if(userData && userData!=""){

            if(!params.get("offset"))
                params.offset=0
            else
                params.offset=Integer.parseInt(params.get("offset"))

            if (params.offset==0)
                params.total=userService.findUsers(userData,userData).size()
            else
                params.total=Integer.parseInt(params.get("total"))

            foundUsers = userService.findUsers(userData,userData,10,params.offset)
        }

        render(view: "user", model: [userData: userData,foundUsers: foundUsers,search: true,params:params])
    }
}
