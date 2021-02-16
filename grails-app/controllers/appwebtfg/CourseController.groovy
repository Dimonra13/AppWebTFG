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
        def filteredLists = authUser?.lists?.findAll {CourseList it -> !it?.courses?.contains(course)}
        if(course)
            render(view: "courseProfile", model: [course: course, user: authUser, lists: filteredLists])
        else
            render status: 404
    }
}
