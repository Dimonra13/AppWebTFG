package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class CourseListController {

    SpringSecurityService springSecurityService
    CourseListService courseListService

    def index() { }

    @Secured(["permitAll"])
    def getCourseList(Long id){
        CourseList cl = CourseList.get(id)
        if(cl)
            render(view: 'courseList', model: [courseList:cl,user: null])
        else
            render status: 404
    }

    @Secured('isAuthenticated()')
    def getMyCourseList(Long id){
        User authUser = springSecurityService.getCurrentUser() as User
        CourseList cl = CourseList.get(id)
        if(cl)
            render(view: 'courseList', model: [courseList:cl,user: authUser])
        else
            render status: 404
    }

    @Secured('isAuthenticated()')
    def createCourseList(){
        render(view: 'createCourseList')
    }

    @Secured('isAuthenticated()')
    def create(){
        User authUser = springSecurityService.getCurrentUser() as User
        CourseList newcl = courseListService.createCourseList(authUser, params?.name, params?.description)
        if (newcl) {
            redirect(controller: "User", action: "myProfile")
        } else {
            render(view: 'createCourseList', model: [error: true])
        }
    }

    @Secured('isAuthenticated()')
    def deleteMyCourseList(Long id){
        User authUser = springSecurityService.getCurrentUser() as User
        courseListService.deleteCourseList(authUser, params?.id as Long)
        redirect(controller: "User", action: "myProfile")
    }

}
