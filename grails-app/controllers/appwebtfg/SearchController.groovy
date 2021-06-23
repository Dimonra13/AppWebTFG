package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class SearchController {

    UserService userService
    CourseService courseService
    RecommenderService recommenderService
    SpringSecurityService springSecurityService

    /**
     * Method the returns the page used for searching users with a certain name or email
     * @return view "search/user"
     */
    @Secured(["permitAll"])
    def user(){
    }

    /**
     * Method that returns the page used for searching users with a certain name or email, with the
     * results of the query paginated in pages of maximum 10 elements
     * @return view "search/user"
     */
    @Secured(["permitAll"])
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

    /**
     * Method the returns the page used for searching courses with a certain title
     * @return view "search/course"
     */
    @Secured(["permitAll"])
    def course() {
    }

    /**
     * Method that returns the page used for searching courses with a certain title, with the results of the query
     * paginated in pages of maximum 10 elements
     * @return view "search/course"
     */
    @Secured(["permitAll"])
    def searchCourse(){
        String courseData = params.get("courseData")
        List<Course> foundCourses = null
        boolean isMore = false;
        if(courseData && courseData!=""){
            User authUser = springSecurityService.getCurrentUser() as User
            if(authUser)
                userService.saveRecentSearch(authUser,courseData)
            if(!params.get("offset"))
                params.offset=0
            else
                params.offset=Integer.parseInt(params.get("offset"))
            foundCourses = courseService.findCoursesByTitle(courseData,10,params.offset)
            isMore = courseService.findCoursesByTitle(courseData,10,params.offset+10) as boolean
        }
        render(view: "course", model: [courseData: courseData,foundCourses: foundCourses,search: true,isMore: isMore,params:params])
    }

    @Secured(["permitAll"])
    def semantic(){
    }

    @Secured(["permitAll"])
    def semanticSearch(){
        String data = params.get("courseData")
        List<Course> foundCourses = null
        User authUser = springSecurityService.getCurrentUser() as User
        if(data && data!=""){
            if(authUser)
                userService.saveRecentSearch(authUser,data)
            foundCourses =  recommenderService.semanticSearch(data,authUser)
        }
        render(view: "semantic", model: [foundCourses: foundCourses,search: true])
    }
}
