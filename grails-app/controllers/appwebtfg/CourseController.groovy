package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

/**
 * Controller used to manage HTTP requests related to courses
 */
@Secured(["permitAll"])
class CourseController {

    SpringSecurityService springSecurityService
    RecommenderService recommenderService
    UserFeedbackService userFeedbackService
    UserService userService
    CourseService courseService

    /**
     * Method that returns the page of a course if it exists or error 404 otherwise
     * @param id
     * @return view "courseProfile" or status 404
     */
    @Secured(["permitAll"])
    def getCourse(Long id) {
        Course course = Course.get(id)
        User authUser = springSecurityService.isLoggedIn() ? springSecurityService.getCurrentUser() : null
        def filteredLists = authUser?.lists?.findAll { CourseList it -> !it?.courses?.contains(course) }
        String recommendation = params.get("recommendation")
        Integer bannedCourse = params.get("bannedCourse") as Integer
        List<Course> related
        String isLast = null
        if(bannedCourse && authUser){
            userService.saveBannedCourse(authUser,Course?.get(bannedCourse)?.idCurso)
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateNotInterested(authUser,Course?.get(bannedCourse)?.originalPage)
            List<Integer> relatedToCourseIDs
            if(!params.isLast){
                relatedToCourseIDs = params.get("relatedToCourseIDs").collect{it->Integer.parseInt(it)}
                if (relatedToCourseIDs.size()==2)
                    isLast="true"
            }else{
                relatedToCourseIDs = new LinkedList<>();
                relatedToCourseIDs.add(params.get("relatedToCourseIDs") as Integer)
                isLast=null
            }
            related = courseService.getCourses(relatedToCourseIDs)
        }else {
            if(authUser&&recommendation&&!params.fromCreate){
                if(!authUser?.feedback)
                    userFeedbackService.createUserFeedback(authUser)
                userFeedbackService.updateClicks(authUser,recommendation)
                if(recommendation=="semanticSearch")
                        userService.saveRecentSearch(authUser,course.title)
            }else if(authUser&&params.search&&!params.fromCreate){
                userService.saveRecentSearch(authUser,course.title)
            }
            related = recommenderService.getRelatedCourses(course,authUser).findAll{it -> it.id != id}.take(8)
        }
        if (course)
            render(view: "courseProfile", model: [course: course, user: authUser, lists: filteredLists,related:related,recommendationSource:recommendation,isLast:isLast])
        else
            render status: 404
    }
}
