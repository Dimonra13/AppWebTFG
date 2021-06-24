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

    /**
     * Method that returns the page of a course if it exists or error 404 otherwise
     * @param id
     * @return view "courseProfile" or status 404
     */
    @Secured(["permitAll"])
    def getCourse(Long id) {
        Course course = Course.get(id)
        User authUser = springSecurityService.isLoggedIn() ? springSecurityService.getCurrentUser() : null
        String recommendation = params.get("recommendation")
        if(authUser&&recommendation){
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateClicks(authUser,recommendation)
        }
        def filteredLists = authUser?.lists?.findAll { CourseList it -> !it?.courses?.contains(course) }
        List<Course> related = recommenderService.getRelatedCourses(course,authUser)
        if (course)
            render(view: "courseProfile", model: [course: course, user: authUser, lists: filteredLists,related:related,recommendationSource:recommendation])
        else
            render status: 404
    }
}
