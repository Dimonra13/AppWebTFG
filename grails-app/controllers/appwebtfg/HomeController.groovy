package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class HomeController {

    SpringSecurityService springSecurityService
    RecommenderService recommenderService
    CourseService courseService
    UserService userService
    UserFeedbackService userFeedbackService

    /**
     * Method that returns the home page
     * @return view "/index"
     */
    def index() {
        Integer bannedCourse = params.get("bannedCourse") as Integer
        User authUser = springSecurityService.getCurrentUser()
        List<Course> recommendedCourses = []
        List<Course> relatedToQueryCourses = []
        if(bannedCourse && authUser){
            userService.saveBannedCourse(authUser,bannedCourse)
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateNotInterested(authUser,Course?.get(bannedCourse)?.originalPage)
            List<Integer> recommendedCoursesIDs
            try{
                recommendedCoursesIDs = params.get("recommendedCoursesIDs").collect{it->Integer.parseInt(it)}
            }catch(Exception e){
                recommendedCoursesIDs = new LinkedList<>();
                recommendedCoursesIDs.add(params.get("recommendedCoursesIDs") as Integer)
            }
            recommendedCourses = courseService.getCourses(recommendedCoursesIDs)
            List<Integer> relatedToQueryCoursesIDs
            try{
                relatedToQueryCoursesIDs = params.get("relatedToQueryCoursesIDs").collect{it->Integer.parseInt(it)}
            }catch(Exception e){
                relatedToQueryCoursesIDs = new LinkedList<>();
                relatedToQueryCoursesIDs.add(params.get("relatedToQueryCoursesIDs") as Integer)
            }
            relatedToQueryCourses = courseService.getCourses(relatedToQueryCoursesIDs)
            render(view:"/index",model: [authUser: authUser,recommendedCourses:recommendedCourses,relatedToQueryCourses:relatedToQueryCourses])
        }else{
            if(authUser){
                recommendedCourses = recommenderService.getRecommendedCourses(authUser)
                authUser?.recentSearches?.each {String query ->
                    relatedToQueryCourses = relatedToQueryCourses + recommenderService.getRecommendedCoursesRelatedToQuery(authUser,query)
                }
            }
            render(view:"/index",model: [authUser: authUser,recommendedCourses:recommendedCourses,relatedToQueryCourses:relatedToQueryCourses])
        }
    }
}
