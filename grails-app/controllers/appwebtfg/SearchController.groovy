package appwebtfg


import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class SearchController {

    UserService userService

    /**
     * Method the returns the page used for searching users with a certain name or email
     * @return view "search/user"
     */
    def user(){
    }

    /**
     * Method that returns the page used for searching users with a certain name or email, with the
     * results of the query paginated in pages of maximum 10 elements
     * @return view "search/user"
     */
    def searchUser(){
        String userData = params.get("userData")
        List<User> foundUsers = null
        boolean isMore = false;
        if(userData && userData!=""){
            if(!params.get("offset"))
                params.offset=0
            else
                params.offset=Integer.parseInt(params.get("offset"))
            foundUsers = userService.findUsers(userData,userData,10,params.offset)
            isMore = userService.findUsers(userData,userData,10,params.offset+10) as boolean
        }
        render(view: "user", model: [userData: userData,foundUsers: foundUsers,search: true,isMore: isMore,params:params])
    }
}
