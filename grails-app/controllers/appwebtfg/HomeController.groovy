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
        String isLastRecommend = null
        String isLastRelated=null
        if(bannedCourse && authUser){
            userService.saveBannedCourse(authUser,bannedCourse)
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateNotInterested(authUser,Course?.get(bannedCourse)?.originalPage)
            List<Integer> recommendedCoursesIDs
            if(!params.isLastRecommend || (params.isLastRecommend && params?.get("recommendedCoursesIDs")?.size()==2)){
                recommendedCoursesIDs = params?.get("recommendedCoursesIDs")?.collect{it->Integer.parseInt(it)}
                if (recommendedCoursesIDs?.size()==2)
                    isLastRecommend="true"
            }else{
                recommendedCoursesIDs = new LinkedList<>()
                if(params.get("recommendedCoursesIDs")){
                    recommendedCoursesIDs.add(params.get("recommendedCoursesIDs") as Integer)
                    isLastRecommend="true"
                }
            }
            recommendedCourses = courseService.getCourses(recommendedCoursesIDs)
            List<Integer> relatedToQueryCoursesIDs
            if(!params.isLastRelated || (params.isLastRelated && params?.get("relatedToQueryCoursesIDs")?.size()==2)){
                relatedToQueryCoursesIDs = params?.get("relatedToQueryCoursesIDs")?.collect{it->Integer.parseInt(it)}
                if (relatedToQueryCoursesIDs?.size()==2)
                    isLastRelated="true"
            }else{
                relatedToQueryCoursesIDs = new LinkedList<>();
                if(params.get("relatedToQueryCoursesIDs")){
                    relatedToQueryCoursesIDs.add(params.get("relatedToQueryCoursesIDs") as Integer)
                    isLastRelated="true"
                }
            }
            relatedToQueryCourses = courseService.getCourses(relatedToQueryCoursesIDs)
            render(view:"/index",model: [authUser: authUser,recommendedCourses:recommendedCourses,relatedToQueryCourses:relatedToQueryCourses,isLastRecommend:isLastRecommend,isLastRelated:isLastRelated])
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
