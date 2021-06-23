package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class HomeController {

    SpringSecurityService springSecurityService
    RecommenderService recommenderService
    /**
     * Method that returns the home page
     * @return view "/index"
     */
    def index() {
        User authUser = springSecurityService.getCurrentUser()
        List<Course> recommendedCourses = []
        List<Course> relatedToQueryCourses = []
        if(authUser){
            recommendedCourses = recommenderService.getRecommendedCourses(authUser)
            authUser?.recentSearches?.each {String query ->
                relatedToQueryCourses = relatedToQueryCourses + recommenderService.getRecommendedCoursesRelatedToQuery(authUser,query)
            }
        }
        render(view:"/index",model: [authUser: authUser,recommendedCourses:recommendedCourses,relatedToQueryCourses:relatedToQueryCourses])
    }
}
