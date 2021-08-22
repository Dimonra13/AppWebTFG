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
        List<Course> exploreCourses = []
        String isLastRecommend = null
        String isLastRelated=null
        if(bannedCourse && authUser){
            userService.saveBannedCourse(authUser,Course?.get(bannedCourse)?.idCurso)
            userService.removeBannedCoursesFromExploreRecommendations(authUser)
            exploreCourses = courseService.getCourses(authUser?.exploreRecommendationsIds)
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateNotInterested(authUser,Course?.get(bannedCourse)?.originalPage)
            List<Integer> recommendedCoursesIDs
            if(!params.isLastRecommend || (params.isLastRecommend && params?.get("recommendedCoursesIDs")?.size()==2)){
                recommendedCoursesIDs = params?.get("recommendedCoursesIDs")?.findAll{it -> !authUser.bannedCourses.contains(Course?.get(it)?.idCurso)}?.collect{it->Integer.parseInt(it)}
                if (recommendedCoursesIDs?.size()<=2)
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
                relatedToQueryCoursesIDs = params?.get("relatedToQueryCoursesIDs")?.findAll{it -> !authUser.bannedCourses.contains(Course?.get(it)?.idCurso)}?.collect{it->Integer.parseInt(it)}
                if (relatedToQueryCoursesIDs?.size()<=2)
                    isLastRelated="true"
            }else{
                relatedToQueryCoursesIDs = new LinkedList<>();
                if(params.get("relatedToQueryCoursesIDs")){
                    relatedToQueryCoursesIDs.add(params.get("relatedToQueryCoursesIDs") as Integer)
                    isLastRelated="true"
                }
            }
            relatedToQueryCourses = courseService.getCourses(relatedToQueryCoursesIDs)
            render(view:"/index",model: [authUser: authUser,recommendedCourses:recommendedCourses,relatedToQueryCourses:relatedToQueryCourses,isLastRecommend:isLastRecommend,isLastRelated:isLastRelated,exploreCourses:exploreCourses])
        }else{
            if(authUser){
                userService.removeBannedCoursesFromExploreRecommendations(authUser)
                exploreCourses = courseService.getCourses(authUser?.exploreRecommendationsIds)?.toSet()?.toList()
                recommendedCourses = recommenderService?.getRecommendedCourses(authUser)?.findAll{it -> !authUser?.bannedCourses?.contains(it?.idCurso)}?.toSet()?.toList()
                if (recommendedCourses?.size()<=2)
                    isLastRecommend="true"
                authUser?.recentSearches?.each {String query ->
                    relatedToQueryCourses = relatedToQueryCourses + recommenderService.getRecommendedCoursesRelatedToQuery(authUser,query,(16/authUser?.recentSearches.size()) as int)
                }
                relatedToQueryCourses = relatedToQueryCourses?.findAll{it -> !authUser?.bannedCourses?.contains(it?.idCurso)}?.toSet()?.toList()?.take(24)
                if (relatedToQueryCourses?.size()<=2)
                    isLastRelated="true"
            }
            render(view:"/index",model: [authUser: authUser,recommendedCourses:recommendedCourses,relatedToQueryCourses:relatedToQueryCourses,exploreCourses:exploreCourses,isLastRecommend: isLastRecommend,isLastRelated: isLastRelated])
        }
    }

    def coursingmldocs(){
        redirect(url: "http://178.128.45.254/")
    }
}
