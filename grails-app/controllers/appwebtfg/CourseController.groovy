package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class CourseController {

    SpringSecurityService springSecurityService

    def index() { }

    @Secured(["permitAll"])
    def getCourse(Long id){
        Course course = Course.get(id)
        User authUser = springSecurityService.isLoggedIn() ? springSecurityService.getCurrentUser() : null
        if(course)
            render(view: "courseProfile", model: [course: course, user: authUser])
        else
            render status: 404
    }
}
