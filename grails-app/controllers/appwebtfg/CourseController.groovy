package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

/**
 * Controller used to manage HTTP requests related to courses
 */
@Secured(["permitAll"])
class CourseController {

    SpringSecurityService springSecurityService

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
        if (course)
            render(view: "courseProfile", model: [course: course, user: authUser, lists: filteredLists])
        else
            render status: 404
    }
}
