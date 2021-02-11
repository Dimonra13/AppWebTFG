package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class CourseListController {

    SpringSecurityService springSecurityService

    def index() { }

    @Secured('isAuthenticated()')
    def getMyCourseList(Long id){
        User authUser = springSecurityService.getCurrentUser() as User
        CourseList cl = CourseList.get(id)
        render(view: 'courseList', model: [courseList:cl,user: authUser])
    }

    @Secured('isAuthenticated()')
    def createCourseList(){
        User authUser = springSecurityService.getCurrentUser() as User
        render(view: 'createCourseList', model: [user: authUser])
    }

    @Secured(["permitAll"])
    def getCourseList(Long id){
        CourseList cl = CourseList.get(id)
        render(view: 'courseList', model: [courseList:cl,user: null])
    }
}
